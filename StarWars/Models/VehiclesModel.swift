//
//  VehiclesModel.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 02.02.2023.
//

import Foundation

struct VehiclesSummary: Codable {
    let count: Int?
    let results: [ParsingModel]?
}

struct Vehicle: Codable {
    let name: String
    let model: String
    let manufacturer: String
    let cost: String
    let length: String
    let maximumSpeed: String
    let crew: String
    let passengers: String
    let cargoCapacity: String
    let starshipClass: String

    enum CodingKeys: String, CodingKey {
        case name, model, manufacturer, length, crew, passengers
        case cost = "cost_in_credits"
        case maximumSpeed = "max_atmosphering_speed"
        case cargoCapacity = "cargo_capacity"
        case starshipClass = "starship_class"
    }
}
