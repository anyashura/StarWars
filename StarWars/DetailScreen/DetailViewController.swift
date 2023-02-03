//
//  DetailViewController.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 01.02.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    // MARK: - Enum
    private enum Constants {
        static let cellIDDetail = "detailInformation"
        static let detailURLKey = "detail"
        static let categoryKey = "categoryKey"
        static let idKey = "IDKey"
        static let defaultURL = "https://swapi.dev/api/people/1/"
    }

    // MARK: - Properties
    private let spinner = UIActivityIndicatorView(style: .large)
    private let networkManager = NetworManagerForDetailScreen()

    private var collectionView: UICollectionView?
    private var details: DetailParsingModel?
    private var backgroundImage: UIImageView?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage = setBackgroundImage()
        startLoader(spinner: spinner)
        networkManager.fetchDetail(url: UserDefaults.standard.string(forKey: Constants.detailURLKey) ?? Constants.defaultURL, completionHandler: {details in
            self.details = details
            DispatchQueue.main.async {
                self.stopLoader(spinner: self.spinner)
                self.collectionView?.reloadData()
            }
        })
        registerAndConfigureCollection()
    }

    override func viewDidAppear(_ animated: Bool) {
        checkConnection()
    }

    // MARK: - Private methods

    private func addText() -> String {
        var textForCollection = ""
        guard UserDefaults.standard.string(forKey: Constants.categoryKey) != nil else { return "No Data"}
        if UserDefaults.standard.string(forKey: Constants.categoryKey) == "Films" {
            textForCollection =
            """
                     \(String(describing: details?.title ?? "No" ))

            Release date: \(String(describing: details?.releaseDate ?? "No"))
            Episode Id: \(String(describing: details?.episodeId ?? 0))
            Director: \(String(describing: details?.director ?? "No"))
            Producer: \(String(describing: details?.producer ?? "No"))
            Opening crawl:
            \(String(describing: details?.openingCrawl ?? "No"))
            """
        }

        if UserDefaults.standard.string(forKey: Constants.categoryKey) == "Species" {
            textForCollection =
            """
                     \(String(describing: details?.name ?? "No" ))

            Classification: \(String(describing: details?.classification ?? "No"))
            Designation: \(String(describing: details?.designation ?? ""))
            Eye colors: \(String(describing: details?.eyeColors ?? "No"))
            Hair colors: \(String(describing: details?.hairColors ?? "No"))
            Skin Colors: \(String(describing: details?.skinColors ?? "No"))
            Language: \(String(describing: details?.language ?? "No"))
            Average height: \(String(describing: details?.averageHeight ?? "No"))
            Average lifespan: \(String(describing: details?.averageLifespan ?? "No"))
            """
        }

        if UserDefaults.standard.string(forKey: Constants.categoryKey) == "Starships" || UserDefaults.standard.string(forKey: Constants.categoryKey) == "Vehicles" {
            textForCollection =
            """
                     \(String(describing: details?.name ?? "No" ))

            Model: \(String(describing: details?.model ?? "No"))
            Manufacturer: \(String(describing: details?.manufacturer ?? ""))
            Cost: \(String(describing: details?.cost ?? "No"))
            Length: \(String(describing: details?.length ?? "No"))
            Maximum speed: \(String(describing: details?.maximumSpeed ?? "No"))
            Crew: \(String(describing: details?.crew ?? ""))
            Passengers: \(String(describing: details?.passengers ?? "No"))
            Cargo capacity: \(String(describing: details?.cargoCapacity ?? "No"))
            Starship class: \(String(describing: details?.starshipClass ?? "No"))
            """
        }

        if UserDefaults.standard.string(forKey: Constants.categoryKey) == "Characters" {
            textForCollection =
            """
                     \(String(describing: details?.name ?? "No" ))

            Birth year: \(String(describing: details?.birthYear ?? "No"))
            Gender: \(String(describing: details?.gender ?? ""))
            Eye color: \(String(describing: details?.eyeColor ?? "No"))
            Hair color: \(String(describing: details?.hairColor ?? "No"))
            Skin Color: \(String(describing: details?.skinColor ?? "No"))
            Language: \(String(describing: details?.height ?? "No"))
            """
        }

        if UserDefaults.standard.string(forKey: Constants.categoryKey) == "Planets" {
            textForCollection =
            """
                    \(String(describing: details?.name ?? "No" ))

                Climate: \(String(describing: details?.climate ?? "No"))
                Diameter: \(String(describing: details?.diameter ?? ""))
                Gravity: \(String(describing: details?.gravity ?? "No"))
                Rotation period: \(String(describing: details?.rotationPeriod ?? "No"))
                Terrain: \(String(describing: details?.terrain ?? ""))
                Surface water: \(String(describing: details?.surfaceWater ?? "No"))
            """
        }

        return textForCollection
    }

    private func getNameForPicture() -> String {
        var pictureName = ""

        if let category = UserDefaults.standard.string(forKey: Constants.categoryKey), let id = UserDefaults.standard.string(forKey: Constants.idKey) {
            pictureName = category + id
        } else {
            pictureName = "temp"
        }
        return pictureName
    }

    private func registerAndConfigureCollection() {

        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .clear
        collectionView?.showsVerticalScrollIndicator = false

        collectionView?.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: Constants.cellIDDetail)
        view.addSubview(collectionView ?? UICollectionView())

        collectionView?.snp.makeConstraints {
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.left.right.equalTo(view)
        }
        layout.itemSize = CGSize(width: (view.frame.size.width), height: (view.frame.size.height))
    }
}

    // MARK: - Extensions

extension DetailViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIDDetail, for: indexPath) as? DetailCollectionViewCell else {
            return UICollectionViewCell()
            }
        cell.configurePicture(image: UIImage(named: getNameForPicture()) ?? UIImage())

        cell.addText(self.addText())

        return cell
    }
}

extension DetailViewController: UICollectionViewDelegate {

}

