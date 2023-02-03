//
//  PlanetsModel.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 02.02.2023.
//

import Foundation

struct PlanetsSummary: Codable {
    let count: Int?
    let results: [ParsingModel]?
}

struct Planet: Codable {
    let name: String
    let climate: String
    let diameter: String
    let gravity: String
    let residents: [String]
    let rotationPeriod: String
    let terrain: String
    let surfaceWater: String

    enum CodingKeys: String, CodingKey {
        case name, climate, diameter, gravity, residents, terrain
        case rotationPeriod = "rotation_period"
        case surfaceWater = "surface_water"
    }
}
