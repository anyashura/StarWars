//
//  FilmModel.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 02.02.2023.
//

import Foundation

struct FilmsSummary: Codable {
    let count: Int?
    let results: [ParsingModel]?
}

struct Film: Codable {
    let title: String
    let episodeId: Int
    let openingCrawl: String
    let director: String
    let producer: String
    let releaseDate: String

    enum CodingKeys: String, CodingKey {
        case title, producer, director
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        case releaseDate = "release_date"
    }
}
