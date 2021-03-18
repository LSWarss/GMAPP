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
    
    
    func getGames(completion:@escaping ([Game]) -> ()) {
        
        guard let url = Helpers.createUrl(baseComponents: self.baseComponents, pathParams: ["games/"]) else {
            return
        }
            
           URLSession.shared.dataTask(with: url) { (data, _, _) in
               let games = try! JSONDecoder().decode([Game].self, from: data!)
               
               DispatchQueue.main.async {
                   completion(games)
               }
           }
           .resume()
       }
    
    func getGamesForPlatform(platform: String, completion:@escaping ([Game]) -> ()) {
        
        guard let url = Helpers.createUrl(baseComponents: self.baseComponents, pathParams: ["games/", "platform/", platform]) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, request, error) in
            if let error = error {
                print("❌ Error faced on url \(url.description): \(error)")
                return
            }
            let games = try! JSONDecoder().decode([Game].self, from: data!)
            let result = games.sorted {
                $0.formattedDate < $1.formattedDate
            }
            
            DispatchQueue.main.async {
                completion(result)
            }
        }
        .resume()
    }
    
}
