//
//  Extension DetailVC.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 04.02.2023.
//

import Foundation

extension DetailViewController {
    func getData()  {
        if UserDefaults.standard.string(forKey: Constants.categoryKey) == Category.films.title {
            networkForDetailVC.fetchFilm(url: UserDefaults.standard.string(forKey: Constants.detailURLKey) ?? Constants.defaultURL) { details in
                switch  details {
                case .success(let film):
                    self.getFilmAndUpdateCollection(film: film)
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        if UserDefaults.standard.string(forKey: Constants.categoryKey) == Category.planets.title {
            networkForDetailVC.fetchPlanet(url: UserDefaults.standard.string(forKey: Constants.detailURLKey) ?? Constants.defaultURL) { details in
                switch  details {
                case .success(let planet):
                    self.getPlanetAndUpdateCollection(planet: planet)
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        if UserDefaults.standard.string(forKey: Constants.categoryKey) == Category.species.title {
            networkForDetailVC.fetchSpecies(url: UserDefaults.standard.string(forKey: Constants.detailURLKey) ?? Constants.defaultURL) { details in
                switch  details {
                case .success(let species):
                    self.getSpeciesAndUpdateCollection(species: species)
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        if UserDefaults.standard.string(forKey: Constants.categoryKey) == Category.vehicles.title {
            networkForDetailVC.fetchVehicle(url: UserDefaults.standard.string(forKey: Constants.detailURLKey) ?? Constants.defaultURL) { details in
                switch  details {
                case .success(let vehicle):
                    self.getVehicleAndUpdateCollection(vehicle: vehicle)
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        if UserDefaults.standard.string(forKey: Constants.categoryKey) == Category.starships.title {
            networkForDetailVC.fetchStarship(url: UserDefaults.standard.string(forKey: Constants.detailURLKey) ?? Constants.defaultURL) { details in
                switch  details {
                case .success(let starship):
                    self.getStarshipAndUpdateCollection(starship: starship)
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        if UserDefaults.standard.string(forKey: Constants.categoryKey) == Category.characters.title {
            networkForDetailVC.fetchCharacter(url: UserDefaults.standard.string(forKey: Constants.detailURLKey) ?? Constants.defaultURL) { details in
                switch  details {
                case .success(let character):
                    self.getCharacterAndUpdateCollection(character: character)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }

}
