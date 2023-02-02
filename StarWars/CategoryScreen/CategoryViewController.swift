//
//  CategoryViewController.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 31.01.2023.
//

import UIKit

final class CategoryViewController: UIViewController {

    // MARK: - Properties
    private let nameKey = "url"
    private let categoryKey = "categoryKey"
    private let cellID = "category"
    private let network = NetworkManager()
    
    private var allObjects: [ScreenModel]?
    private var collectionView: UICollectionView?
    
    private lazy var url = UserDefaults.standard.string(forKey: nameKey)
    private lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "milkyWay")
        backgroundImage.contentMode = UIView.ContentMode.scaleToFill
        return backgroundImage
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImage)
        setTitile()
        
        registerAndConfigureCollection()
        
        network.fetchCategories(url: url ?? "https://swapi.dev/api/people/", completionHandler: {objects in
            self.allObjects = objects
            print(self.allObjects)
            DispatchQueue.main.async{
                self.collectionView?.reloadData()
            }
        })
    }

    override func viewDidAppear(_ animated: Bool) {
        checkConnection()
    }

    // MARK: - Private methods
    
    private func setTitile() {
        title = UserDefaults.standard.string(forKey: categoryKey)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    private func registerAndConfigureCollection() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .clear
        
        collectionView?.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        view.addSubview(collectionView ?? UICollectionView())
        
        collectionView?.snp.makeConstraints {
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.left.right.equalTo(view).inset(10)
        }
        layout.itemSize = CGSize(width: (view.frame.size.width - 20), height: 65)
    }
}


    // MARK: - Extensions

extension CategoryViewController: UICollectionViewDelegate {

}

extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allObjects?.count ?? 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? CategoryCollectionViewCell else {
        return UICollectionViewCell()
        }
        cell.configure(
            name: allObjects?[indexPath.row].title ?? "",
            title: allObjects?[indexPath.row].name ?? "",
            image: UIImage(named: "temp") ?? UIImage()
        )

        return cell
    }

}
