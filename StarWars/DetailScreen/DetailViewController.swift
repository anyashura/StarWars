//
//  DetailViewController.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 01.02.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    // MARK: - Enum
    enum Constants {
        static let cellIDDetail = "detailInformation"
        static let detailURLKey = "detail"
        static let categoryKey = "categoryKey"
        static let idKey = "IDKey"
        static let defaultURL = "https://swapi.dev/api/people/1/"
    }

    // MARK: - Properties
    let networkForDetailVC = NetworkManagerForDetailScreen.shared
    
    private let spinner = UIActivityIndicatorView(style: .large)
    private var collectionView: UICollectionView?
    private var backgroundImage: UIImageView?
    var textForCollection = "No data"

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage = setBackgroundImage()
        registerAndConfigureCollection()
        startLoader(spinner: spinner)
        getData()
        stopLoader(spinner: spinner)
    }

    override func viewDidAppear(_ animated: Bool) {
        checkConnection()
    }

    // MARK: - Methods
    
    func getFilmAndUpdateCollection(film: Film) {
        textForCollection = "Release date: \(film.releaseDate) \nEpisode Id: \(film.episodeId) \nDirector: \(film.director) \nProducer: \(film.producer) \n\nOpening crawl: \n\(film.openingCrawl)"
       
        DispatchQueue.main.async {
            self.title = film.title
            self.collectionView?.reloadData()
        }
    }
    
    func getPlanetAndUpdateCollection(planet: Planet) {
        textForCollection = "Climate: \(planet.climate) \nDiameter: \(planet.diameter) \nGravity: \(planet.gravity) \nRotation period: \(planet.rotationPeriod) \nTerrain: \(planet.terrain) \nSurface water: \(planet.surfaceWater)"
        
        DispatchQueue.main.async {
            self.title = planet.name
            self.collectionView?.reloadData()
        }
    }
    
    func getSpeciesAndUpdateCollection(species: Species) {
        textForCollection = "Classification: \(species.classification) \nDesignation: \(species.designation) \nEye colors: \(species.eyeColors) \nHair colors: \(species.hairColors) \nSkin Colors: \(species.skinColors) \nLanguage: \(species.language) \nAverage height: \(species.averageHeight) \nAverage lifespan: \(species.averageLifespan)"
        
        DispatchQueue.main.async {
            self.title = species.name
            self.collectionView?.reloadData()
        }
    }
    
    func getStarshipAndUpdateCollection(starship: Starship) {
        textForCollection = "Model: \(starship.model) \nManufacturer: \(starship.manufacturer) \nCost: \(starship.cost) \nLength: \(starship.length) \nMaximum speed: \(starship.maximumSpeed) \nCrew: \(starship.crew) \nPassengers: \(starship.passengers) \nCargo capacity: \(starship.cargoCapacity) \nStarship class: \(starship.starshipClass)"
        
        DispatchQueue.main.async {
            self.title = starship.name
            self.collectionView?.reloadData()
        }
    }
    
    func getVehicleAndUpdateCollection(vehicle: Vehicle) {
        textForCollection = "Model: \(vehicle.model) \nManufacturer: \(vehicle.manufacturer) \nCost: \(vehicle.cost) \nLength: \(vehicle.length) \nMaximum speed: \(vehicle.maximumSpeed) \nCrew: \(vehicle.crew) \nPassengers: \(vehicle.passengers) \nCargo capacity: \(vehicle.cargoCapacity) \nVehicle class: \(vehicle.starshipClass)"
        
        DispatchQueue.main.async {
            self.title = vehicle.name
            self.collectionView?.reloadData()
        }
    }
    
    func getCharacterAndUpdateCollection(character: Character) {
        textForCollection = "Birth year: \(character.birthYear) \n\nGender: \(character.gender) \n\nEye color: \(character.eyeColor) \n\nHair color: \(character.hairColor) \n\nSkin Color: \(character.skinColor) \n\nHeight: \(character.height)"
        
        DispatchQueue.main.async {
            self.title = character.name
            self.collectionView?.reloadData()
        }
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
        cell.addText(textForCollection)
        return cell
    }
}

extension DetailViewController: UICollectionViewDelegate {

}

