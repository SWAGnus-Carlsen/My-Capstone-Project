//
//  APIManager.swift
//  FutStats
//
//  Created by Vitaliy Halai on 1.03.23.
//

import UIKit


class APIManager {
    static var shared = APIManager()
    private init() {}
    
    
    func fetchMatches(from urlString: String) -> [Match] {
        guard let url = URL(string: urlString) else {
            print("Error occured while converting url")
            return []
        }
        var request = URLRequest(url: url)
        request.addValue("6903b3a318d24f9d9c9b5c315b86a4e0", forHTTPHeaderField: "X-Auth-Token")
        
        var matches = Welcome.self
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data, error == nil else { return }
            
            var result: Welcome?
            do {
                result = try JSONDecoder().decode(matches.self, from: data)
            }
            catch {
                print("failed to convert: \(error)")
            }
            guard  let result else { return }
            matches = result.matches
            
        }
        task.resume()
        return matches
    }
}

