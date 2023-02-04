//
//  SpeciesModel.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 02.02.2023.
//

import Foundation

struct SpeciesSummary: Codable {
    let count: Int?
    let results: [ParsingModel]?
}

struct Species: Codable {
    let name: String
    let classification: String
    let designation: String
    let eyeColors: String
    let hairColors: String
    let skinColors: String
    let language: String
    let averageHeight: String
    let averageLifespan: String

    enum CodingKeys: String, CodingKey {
        case name, classification, designation, language
        case eyeColors = "eye_colors"
        case hairColors = "hair_colors"
        case skinColors = "skin_colors"
        case averageHeight = "average_height"
        case averageLifespan = "average_lifespan"
    }
}
