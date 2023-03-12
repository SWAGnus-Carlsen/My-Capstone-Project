//
//  APIManager.swift
//  FutStats
//
//  Created by Vitaliy Halai on 1.03.23.
//

import SVGKit
import SwiftyJSON
import UIKit

class APIManager {
    static var shared = APIManager()
    private init() {}
 
    func fetchMatches(from urlString: String, completion: @escaping ([Match]) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Error occured while converting url in #fetchMatches func")
            return
        }
        var request = URLRequest(url: url)
        request.addValue(APIConstants.authToken,
                         forHTTPHeaderField: APIConstants.nameOfHeader)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data, error == nil else { return }
            
            do {
                let jsonData = try JSONDecoder().decode(MatchesFromJSON.self, from: data)
                print(try JSON(data: data))
                completion(jsonData.matches)
            } catch {
                print("failed to convert: \(error)")
            }
        }
        task.resume()
    }
    
    func fetchLogos(URLString: String, for imageView: UIImageView) {
        var hasSVG = false
        if URLString.contains(".svg") {
            hasSVG = true
        }
        
        guard let URL = URL(string: URLString) else { return }
        
        var request = URLRequest(url: URL)
        request.addValue(APIConstants.authToken,
                         forHTTPHeaderField: APIConstants.nameOfHeader)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if hasSVG {
                // Add the SVGKImageView to the view hierarchy
                DispatchQueue.main.async {
                    guard error == nil, let data = data else {
                        print("Error fetching SVG image: \(error?.localizedDescription ?? "unknown error")")
                        return
                    }
                    // Create an SVGKImage object from the SVG data
                    let svgImage = SVGKImage(data: data)
                
                    // Create an SVGKImageView and set its image to the SVGKImage
                    guard let svgView = SVGKFastImageView(svgkImage: svgImage) else {
                        return
                    }
                    svgView.frame.size = imageView.frame.size
                    imageView.image = nil
                    imageView.insertSubview(svgView, at: 1)
                }
            } else {
                DispatchQueue.main.async {
                    if let data,
                       error == nil,
                       let image = UIImage(data: data)
                    {
                        imageView.image = image
                    } else {
                        imageView.image = UIImage(named: "placeholder")
                    }
                }
            }
        }
        task.resume()
    }
    
    
    func fetchStandings(from urlString: String, completion: @escaping ([Standing]) -> Void) {
        
        guard let url = URL(string: urlString) else {
            print("Error occured while converting url in #fetchStandings func")
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue(APIConstants.authToken,
                         forHTTPHeaderField: APIConstants.nameOfHeader)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data, error == nil else { return }
            
            do {
                let jsonData = try JSONDecoder().decode(StandingsFromJSON.self, from: data)
                print(try JSON(data: data))
                completion(jsonData.standings)
            } catch {
                print("failed to convert: \(error)")
            }
            
        }
        task.resume()
    }
    
}
