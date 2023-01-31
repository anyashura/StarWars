//
//  CategoryViewController.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 31.01.2023.
//

import UIKit

class CategoryViewController: UIViewController {
    
    // MARK: - Properties
    
    private let cellID = "category"
    
    private lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "milkyWay")
        backgroundImage.contentMode = UIView.ContentMode.scaleToFill
        return backgroundImage
    }()
    
    private var collectionView: UICollectionView?
    

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImage)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkConnection()
        registerAndConfigureCollection()
    }
    
    // MARK: - Private methods
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
        layout.itemSize = CGSize(width: (view.frame.size.width-20), height: 65)
    }
    

}

extension CategoryViewController: UICollectionViewDelegate {

}

extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? CategoryCollectionViewCell else {
        return UICollectionViewCell()
        }

        return cell
    }

}
