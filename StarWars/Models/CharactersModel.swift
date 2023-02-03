//
//  CharactersModel.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 02.02.2023.
//

import Foundation

struct CharactersSummary: Codable {
    let count: Int?
    let results: [ParsingModel]?
}

struct Character: Codable {
    let name: String
    let birthYear: String
    let eyeColor: String
    let gender: String
    let hairColor: String
    let skinColor: String
    let height: String
    let homeworld: String

    enum CodingKeys: String, CodingKey {
        case name, gender, height, homeworld
        case birthYear = "birth_year"
        case eyeColor = "eye_color"
        case hairColor = "hair_color"
        case skinColor = "skin_color"
    }
}
