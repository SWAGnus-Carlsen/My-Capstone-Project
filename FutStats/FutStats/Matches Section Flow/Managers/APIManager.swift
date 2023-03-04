//
//  APIManager.swift
//  FutStats
//
//  Created by Vitaliy Halai on 1.03.23.
//

import UIKit
import SwiftyJSON

class APIManager {
    
    static var shared = APIManager()
    private init() {}
 
    func fetchMatches(from urlString: String,  completion: @escaping ([Match]) -> Void)  {
        guard let url = URL(string: urlString) else {
            print("Error occured while converting url")
           return
        }
        var request = URLRequest(url: url)
        request.addValue("6903b3a318d24f9d9c9b5c315b86a4e0", forHTTPHeaderField: "X-Auth-Token")
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data, error == nil else { return }
            
            
            do {
                
                let jsonData = try JSONDecoder().decode(Welcome.self, from: data)
                print(try JSON(data: data))
                completion(jsonData.matches)
   
            }
            catch {
                print("failed to convert: \(error)")
            }
 
        }
        task.resume()
    }
    
     func fetchLogos(URLString: String, for imageView: UIImageView) {
        guard let URL = URL(string: URLString)
              
         else {
            return
        }
        var request = URLRequest(url: URL)
         request.addValue("6903b3a318d24f9d9c9b5c315b86a4e0", forHTTPHeaderField: "X-Auth-Token")
        let homeTask = URLSession.shared.dataTask(with: request) { data, response, error in
            
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
        homeTask.resume()
    }
}

