//
//  API Constants.swift
//  FutStats
//
//  Created by Vitaliy Halai on 8.03.23.
//

import Foundation

class ApiStringURLs {
   
    static let todayMatches = "https://api.football-data.org/v4/matches"
    
   // static let matchesForConcreteDateString = "https://api.football-data.org/v4/matches?date=2023-01-01"
    
    
    static func matchesForConcreteDate(date: String) -> String {
        "https://api.football-data.org/v4/matches?date=\(date)"
    }
    
//    //users
//    static let usersPath = localServerPath + "users"
//    static let usersPathURL = URL(string: usersPath)
//
//    // posts
//    static let postsPath = localServerPath + "posts"
//    static let postsPathURL = URL(string: postsPath)
//
//    // comments
//    static let commentsPath = localServerPath + "comments"
//    static let commentsPathURL = URL(string: commentsPath)
//
//    // albums
//    static let albumsPath = localServerPath + "albums"
//    static let albumsPathURL = URL(string: albumsPath)
//
//    // photos
//    static let photosPath = localServerPath + "photos"
//    static let photosPathURL = URL(string: photosPath)
//
//    //todos
//    static let todosPath = localServerPath + "todos"
//    static let todosPathURL = URL(string: todosPath)
}
