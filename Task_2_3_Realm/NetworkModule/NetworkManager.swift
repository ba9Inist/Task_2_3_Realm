//
//  NetworkManager.swift
//  Task_2_3_Realm
//
//  Created by Егор Голубев on 29.05.2025.
//

import Foundation
import UIKit

final class NetworkManager {
    
    func getRandomCitation(competition: @escaping(Result<RandomCitationJson, Error>) -> Void) {
        
        guard let url = URL(string: "https://api.chucknorris.io/jokes/random") else
        { return competition(.failure(NSError(domain: "URL bad", code: 10))) }
        
        let task = URLSession.shared.dataTask(with: url) { data, responce , error in
            
            if let error = error {
                return competition(.failure(error.localizedDescription as! Error))
            }
            
            guard let data = data else {
                return competition(.failure(NSError(domain: "Not data", code: 20)))
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let dataJson =  try jsonDecoder.decode(RandomCitationJson.self, from: data)
                return competition(.success(dataJson))
            } catch {
                return competition(.failure(error.localizedDescription as! Error))
            }
        }
        
        task.resume()
        
    }
}
