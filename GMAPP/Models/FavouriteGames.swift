//
//  FavouriteGames.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 22/03/2021.
//

import Foundation
import SwiftUI

class FavouriteGames : ObservableObject {
    
    @Published var games = [Game]()
    
    init() {
        games = decodeGamesToDefaults()
        
    }
    
    func appendGame(game: Game) {
        games.append(game)
        encodeGamesToDefaults(games: games)
    }
    
    func removeGame(game: Game) {
        if let index = games.firstIndex(where: {$0.id == game.id}) {
            games.remove(at: index)
            encodeGamesToDefaults(games: games)
        }
    }
    
    fileprivate func encodeGamesToDefaults(games: [Game]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(games) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "favGames")
        }
    }
    
    fileprivate func decodeGamesToDefaults() -> [Game] {
        var favouriteGames = [Game]()
        let defaults = UserDefaults.standard
        if let favGames = try? defaults.object(forKey: "favGames") as? Data {
            let decoder = JSONDecoder()
            if let loadedGames = try? decoder.decode([Game].self, from: favGames) {
                Logger.shared.log("Loaded games for UserDefaults: \(loadedGames.count)")
                favouriteGames = loadedGames
            }
        }
        return favouriteGames
    }
    
    
}
