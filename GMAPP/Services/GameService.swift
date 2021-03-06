//
//  GameService.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 18/03/2021.
//

import Foundation

class GameService {
    
    private var baseComponents : URLComponents

    init() {
        self.baseComponents = URLComponents()
        self.baseComponents.scheme = Constants.GMAPIDetails.APIScheme
        self.baseComponents.host   = Constants.GMAPIDetails.APIHost
        self.baseComponents.path   = Constants.GMAPIDetails.APIPath
    }
    
    
    func getGames(completion: @escaping (Result<[Game], NetworkError>) -> Void) {
        
        guard let url = Helpers.createUrl(baseComponents: self.baseComponents, pathParams: ["games/"]) else {
            completion(.failure(.urlError))
            return
        }
            
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                if let error = error {
                    Logger.shared.error(error.localizedDescription)
                    completion(.failure(.domainError))
                }
                return
            }
            
            do {
                let games = try JSONDecoder().decode([Game].self, from: data)
                let result = games.sorted {
                    $0.formattedDate < $1.formattedDate
                }
                Logger.shared.log("\(result.count)")
                completion(.success(result))
            } catch {
                Logger.shared.error("Decoding error")
                completion(.failure(.decodingError))
            }
            
           }.resume()
       }
    
    
    func getGames(platform: String, completion: @escaping (Result<[Game], NetworkError>) -> Void) {
        
        guard let url = Helpers.createUrl(baseComponents: self.baseComponents, pathParams: ["games/", "platform/", platform]) else {
            completion(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                if let error = error {
                    Logger.shared.error(error.localizedDescription)
                    completion(.failure(.domainError))
                }
                return
            }
            
            do {
                let games = try JSONDecoder().decode([Game].self, from: data)
                let result = games.sorted {
                    $0.formattedDate < $1.formattedDate
                }
                Logger.shared.log("\(result.count)")
                completion(.success(result))
            } catch {
                Logger.shared.error("Decoding error")
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
    
    func getGenres(completion: @escaping (Result<[Genre], NetworkError>) -> Void) {
        
        guard let url = Helpers.createUrl(baseComponents: self.baseComponents, pathParams: ["games/", "/genres"]) else {
            completion(.failure(.urlError))
            return
        }
            
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                if let error = error {
                    Logger.shared.error(error.localizedDescription)
                    completion(.failure(.domainError))
                }
                return
            }
            
            do {
                let genres = try JSONDecoder().decode([Genre].self, from: data)
                Logger.shared.log("\(genres.count)")
                completion(.success(genres))
            } catch {
                Logger.shared.error("Decoding error")
                completion(.failure(.decodingError))
            }
            
           }.resume()
       }
    
    func getPlatforms(completion: @escaping (Result<[Platform], NetworkError>) -> Void) {
        
        guard let url = Helpers.createUrl(baseComponents: self.baseComponents, pathParams: ["games/", "/platforms"]) else {
            completion(.failure(.urlError))
            return
        }
            
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                if let error = error {
                    Logger.shared.error(error.localizedDescription)
                    completion(.failure(.domainError))
                }
                return
            }
            
            do {
                let platforms = try JSONDecoder().decode([Platform].self, from: data)
                Logger.shared.log("\(platforms.count)")
                completion(.success(platforms))
            } catch {
                Logger.shared.error("Decoding error")
                completion(.failure(.decodingError))
            }
            
           }.resume()
       }
    
}
