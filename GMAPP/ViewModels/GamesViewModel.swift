//
//  GamesViewModel.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 27/02/2021.
//

import Foundation


class GamesViewModel {
    
    func getGames(completion:@escaping ([Game]) -> ()) {
            guard let url = URL(string: "http://gmapi.org/games") else { return }
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                let games = try! JSONDecoder().decode([Game].self, from: data!)
                
                DispatchQueue.main.async {
                    completion(games)
                }
            }
            .resume()
        }
}
