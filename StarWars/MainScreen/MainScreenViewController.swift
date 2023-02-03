//
//  MainScreenViewController.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 29.01.2023.
//

import UIKit

final class MainScreenViewController: UIViewController {
    // MARK: - Enum
    private enum Constants {
        static let nameKey = "url"
        static let categoryKey = "categoryKey"
        static let cellID = "cellID"
        static let title = "Categories"
        static var url = "https://swapi.dev/api/people/"
    }

    // MARK: - Properties
    private let categories: [Category] = [.characters, .films, .species, .starships, .vehicles, .planets]
    private var collectionView: UICollectionView?
    private var films: [Film]?
    private var backgroundImage: UIImageView?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage = setBackgroundImage()
        setTitle()
        registerAndConfigureCollection()
    }

    override func viewDidAppear(_ animated: Bool) {
        checkConnection()
    }

    // MARK: - Private methods

    private func setTitle() {
        title = Constants.title
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
    }

    private func registerAndConfigureCollection() {

        let layout = UICollectionViewFlowLayout()

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .clear
        collectionView?.register(MainScreenCollectionViewCell.self, forCellWithReuseIdentifier: Constants.cellID)

        view.addSubview(collectionView ?? UICollectionView())

        collectionView?.snp.makeConstraints {
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.left.right.equalTo(view).inset(10)
        }

        let space: CGFloat = (layout.minimumInteritemSpacing ) + 20
        layout.itemSize = CGSize(width: (view.frame.size.width-space)/2, height: (view.frame.size.width-space)/2)
    }
}

    // MARK: - Extensions
extension MainScreenViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let category = categories[indexPath.row]
        Constants.url = category.url
        UserDefaults.standard.set(Constants.url, forKey: Constants.nameKey)
        UserDefaults.standard.set(category.title, forKey: Constants.categoryKey)
        let viewController = CategoryViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension MainScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellID, for: indexPath) as? MainScreenCollectionViewCell else { return UICollectionViewCell() }

        cell.configure(
            label: categories[indexPath.row].title,
            image: categories[indexPath.row].image ?? UIImage()
        )
        return cell
    }
}
