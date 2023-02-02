//
//  ScreenModel.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 02.02.2023.
//

import Foundation

struct ParsingModelSummary: Codable {
    let count: Int?
    let results: [ParsingModel]?
}

struct ParsingModel: Codable {
    let title: String?
    let name: String?
}
