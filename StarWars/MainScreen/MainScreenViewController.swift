//
//  MainScreenViewController.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 29.01.2023.
//

import UIKit

class MainScreenViewController: UIViewController {
    // MARK: - Enums
    private enum Constants {
        static let cellID = "cellID"
        static let backgroundImageName = "milkyWay"
    }

    // MARK: - Properties

    private let categories: [Category] = [.characters, .films, .species, .starships, .vehicles, .planets]

    private lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: Constants.backgroundImageName)
        backgroundImage.contentMode = UIView.ContentMode.scaleToFill
        return backgroundImage
    }()

    private var collectionView: UICollectionView?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImage)

        registerAndConfigureCollection()
    }

    override func viewDidAppear(_ animated: Bool) {
        checkConnection()
    }

    // MARK: - Private methods
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

        let categoryVC = CategoryViewController()
        navigationController?.pushViewController(categoryVC, animated: true)
      }

}

extension MainScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellID, for: indexPath) as? MainScreenCollectionViewCell else {
        return UICollectionViewCell()
        }
        cell.configure(label: categories[indexPath.row].title, image: categories[indexPath.row].image ?? UIImage())
        return cell
    }

}
