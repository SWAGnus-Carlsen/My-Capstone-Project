//
//  Standings.swift
//  FutStats
//
//  Created by Vitaliy Halai on 12.03.23.
//

import Foundation


// MARK: - StandingsFromJSON
struct StandingsFromJSON: Codable {
    let filters: FiltersStand
    let area: Area
    let competition: Competition?
    let season: Season
    let standings: [Standing]
}


// MARK: - Filters
struct FiltersStand: Codable {
    let season: String
}

// MARK: - Standing
struct Standing: Codable {
    let stage, type: String
    let group: String?
    let table: [TableElement]
}

// MARK: - Table
struct TableElement: Codable {
    let position: Int
    let team: Team
    let playedGames: Int
    let form: String
    let won, draw, lost, points: Int
    let goalsFor, goalsAgainst, goalDifference: Int
}

// MARK: - Team
struct Team: Codable {
    let id: Int?
    let name, shortName, tla: String?
    let crest: String?
}


