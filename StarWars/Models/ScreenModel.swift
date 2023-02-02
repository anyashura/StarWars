//
//  ScreenModel.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 02.02.2023.
//

import Foundation

struct ScreenModelSummary: Codable {
    let count: Int?
    let results: [ScreenModel]?
}

struct ScreenModel: Codable {
    let title: String?
    let name: String?
}
