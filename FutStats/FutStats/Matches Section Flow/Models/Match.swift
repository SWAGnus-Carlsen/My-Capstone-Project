//
//  Match.swift
//  FutStats
//
//  Created by Vitaliy Halai on 6.02.23.
//

import UIKit

// MARK: - Welcome
struct Welcome: Codable {
    let filters: Filters
    let resultSet: ResultSet
    let matches: [Match]
}
extension Welcome {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Welcome.self, from: data)
    }

}

// MARK: - ResultSet
struct ResultSet: Codable {
    let count: Int?
    let competitions, first, last: String?
    let played: Int?
}

// MARK: - Filters
struct Filters: Codable {
    let dateFrom, dateTo, permission: String?
}

// MARK: - Match
struct Match: Codable {
    let area: Area?
    let competition: Competition?
    let season: Season?
    let id: Int?
    let utcDate: String?
    let status: String?
    let matchday: Int?
    let stage: String?
    let group: String?
    let lastUpdated: String?
    let homeTeam, awayTeam: Team?
    let score: Score?
    let odds: Odds?
    let referees: [Referee]?
}

// MARK: - Area
struct Area: Codable {
    let id: Int?
    let name, code: String?
    let flag: String?
}

// MARK: - Team
struct Team: Codable {
    let id: Int?
    let name, shortName, tla: String?
    let crest: String?
}

// MARK: - Competition
struct Competition: Codable {
    let id: Int?
    let name, code, type: String?
    let emblem: String?
}

// MARK: - Odds
struct Odds: Codable {
    let msg: String?
}

// MARK: - Referee
struct Referee: Codable {
    let id: Int?
    let name, type, nationality: String?
}

// MARK: - Score
struct Score: Codable {
    let winner: String?
    let duration: String?
    let fullTime, halfTime: Time?
}

// MARK: - Time
struct Time: Codable {
    let home, away: Int?
}

// MARK: - Season
struct Season: Codable {
    let id: Int?
    let startDate, endDate: String?
    let currentMatchday: Int?
    let winner: String?
}



// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

