//
//  CategoryViewController.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 31.01.2023.
//

import UIKit

final class CategoryViewController: UIViewController {
    // MARK: - Enum
    private enum Constants {
        static let urlKey = "url"
        static let detailURLKey = "detail"
        static let categoryKey = "categoryKey"
        static let idKey = "IDKey"
        static let cellID = "category"
        static let defaultURL = "https://swapi.dev/api/people/"
    }

    // MARK: - Properties
    private let spinner = UIActivityIndicatorView(style: .large)
    private let network: NetworkService = NetworkManager()
    private var allObjects: [ParsingModel]?
    private var collectionView: UICollectionView?
    private var backgroundImage: UIImageView?
    private lazy var url = UserDefaults.standard.string(forKey: Constants.urlKey)

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage = setBackgroundImage()
        setTitile(Constants.categoryKey)
        registerAndConfigureCollection()
        startLoader(spinner: spinner)
        network.fetchCategories(url: url ?? Constants.defaultURL, completionHandler: { [weak self]
            objects in
            self?.allObjects = objects
            DispatchQueue.main.async {
                self?.stopLoader(spinner: self?.spinner ?? UIActivityIndicatorView())
                self?.collectionView?.reloadData()
            }
        })
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
        collectionView?.showsVerticalScrollIndicator = false

        collectionView?.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.cellID)
        view.addSubview(collectionView ?? UICollectionView())

        collectionView?.snp.makeConstraints {
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.left.right.equalTo(view).inset(10)
        }
        layout.itemSize = CGSize(width: (view.frame.size.width - 20), height: 65)
    }
}

    // MARK: - Extensions

extension CategoryViewController {

    func setTitile(_ name: String) {
        title = UserDefaults.standard.string(forKey: name)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
    }
}

extension CategoryViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let viewController = DetailViewController()
        let detailURL = (url! + String(indexPath.row + 1) + "/")
        UserDefaults.standard.set(detailURL, forKey: Constants.detailURLKey)
        UserDefaults.standard.set(indexPath.row + 1, forKey: Constants.idKey)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension CategoryViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allObjects?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellID, for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(
            name: allObjects?[indexPath.row].title ?? "",
            title: allObjects?[indexPath.row].name ?? "",
            image: UIImage(named: (UserDefaults.standard.string(forKey: Constants.categoryKey) ?? "") + String(indexPath.row + 1)) ?? UIImage()

            )
        return cell
    }
}
