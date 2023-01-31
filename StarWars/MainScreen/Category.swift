//
//  Category.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 31.01.2023.
//

import Foundation
import UIKit

enum Category {
    case characters
    case films
    case species
    case starships
    case vehicles
    case planets

    var title: String {
    switch self {
        case .characters: return "Characters"
        case .films: return "Films"
        case .species: return "Species"
        case .starships: return "Starships"
        case .vehicles: return "Vehicles"
        case .planets: return "Planets"
        }
    }

    var image: UIImage? {
    switch self {
        case .characters: return UIImage(named: "character")
        case .films: return UIImage(named: "films")
        case .species: return UIImage(named: "species")
        case .starships: return UIImage(named: "starships")
        case .vehicles: return UIImage(named: "vehicles")
        case .planets: return UIImage(named: "planets")
        }
    }

    var url: String {
        switch self {
            case .characters: return "https://swapi.dev/api/people/"
            case .films: return "https://swapi.dev/api/films/"
            case .species: return "https://swapi.dev/api/species/"
            case .starships: return "https://swapi.dev/api/starships/"
            case .vehicles: return "https://swapi.dev/api/vehicles/"
            case .planets: return "https://swapi.dev/api/planets/"
            }

    }

}
