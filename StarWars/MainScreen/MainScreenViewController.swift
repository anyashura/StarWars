//
//  MainScreenViewController.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 29.01.2023.
//

import UIKit

final class MainScreenViewController: UIViewController {

    // MARK: - Properties

    private let nameKey = "url"
    private let categoryKey = "categoryKey"
    private let cellID = "cellID"
    private let backgroundImageName = "milkyWay"
    private let categories: [Category] = [.characters, .films, .species, .starships, .vehicles, .planets]
    private var url = "https://swapi.dev/api/people/"
    private var collectionView: UICollectionView?
    private var films: [Film]?

    private lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: backgroundImageName)
        backgroundImage.contentMode = UIView.ContentMode.scaleToFill
        return backgroundImage
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImage)
        setTitle()
        registerAndConfigureCollection()
    }

    override func viewDidAppear(_ animated: Bool) {
        checkConnection()
    }

    // MARK: - Private methods

    private func setTitle() {
        title = "Categories"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
    }

    private func registerAndConfigureCollection() {

        let layout = UICollectionViewFlowLayout()

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .clear
        collectionView?.register(MainScreenCollectionViewCell.self, forCellWithReuseIdentifier: cellID)

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
        url = category.url
        UserDefaults.standard.set(url, forKey: nameKey)
        UserDefaults.standard.set(category.title, forKey: categoryKey)
        let viewController = CategoryViewController()
//        switch category {
//        case .films: viewController = FilmsViewController()
//        default: viewController = FilmsViewController()
//        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension MainScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? MainScreenCollectionViewCell else { return UICollectionViewCell() }

        cell.configure(
            label: categories[indexPath.row].title,
            image: categories[indexPath.row].image ?? UIImage()
        )
        return cell
    }

}
