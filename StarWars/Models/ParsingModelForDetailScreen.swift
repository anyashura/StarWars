//
//  ParsingModelForDetailScreen.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 03.02.2023.
//

import Foundation

struct DetailParsingModel: Codable {

    // planets
    let name: String?
    let climate: String?
    let diameter: String?
    let gravity: String?
    let residents: [String]?
    let rotationPeriod: String?
    let terrain: String?
    let surfaceWater: String?
    // films
    let title: String?
    let episodeId: Int?
    let openingCrawl: String?
    let director: String?
    let producer: String?
    let releaseDate: String?
    // starships, vehicles
    let model: String?
    let manufacturer: String?
    let cost: String?
    let length: String?
    let maximumSpeed: String?
    let crew: String?
    let passengers: String?
    let cargoCapacity: String?
    let starshipClass: String?
    // species
    let classification: String?
    let designation: String?
    let eyeColors: String?
    let hairColors: String?
    let skinColors: String?
    let language: String?
    let averageHeight: String?
    let averageLifespan: String?
    // characters
    let birthYear: String?
    let eyeColor: String?
    let gender: String?
    let hairColor: String?
    let skinColor: String?
    let height: String?
    let homeworld: String?

    enum CodingKeys: String, CodingKey {

        // planets
        case name, climate, diameter, gravity, residents, terrain
        case rotationPeriod = "rotation_period"
        case surfaceWater = "surface_water"
        // films
        case title, producer, director
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        case releaseDate = "release_date"
        // starships, vehicles
        case model, manufacturer, length, crew, passengers
        case cost = "cost_in_credits"
        case maximumSpeed = "max_atmosphering_speed"
        case cargoCapacity = "cargo_capacity"
        case starshipClass = "starship_class"
        // species
        case classification, designation, language
        case eyeColors = "eye_colors"
        case hairColors = "hair_colors"
        case skinColors = "skin_colors"
        case averageHeight = "average_height"
        case averageLifespan = "average_lifespan"
        // characters
        case gender, height, homeworld
        case birthYear = "birth_year"
        case eyeColor = "eye_color"
        case hairColor = "hair_color"
        case skinColor = "skin_color"
    }
}
