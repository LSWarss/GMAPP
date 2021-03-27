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
        games = FavouriteGames.decodeGamesToDefaults()
        
    }
    
    func appendGame(game: Game) {
        games.append(game)
        encodeGamesToDefaults(games: games)
        Helpers.refreshWidgetData()
    }
    
    func removeGame(game: Game) {
        if let index = games.firstIndex(where: {$0.id == game.id}) {
            games.remove(at: index)
            encodeGamesToDefaults(games: games)
            Helpers.refreshWidgetData()
        }
    }
    
    fileprivate func encodeGamesToDefaults(games: [Game]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(games) {
            let shared = UserDefaults(suiteName: "group.gmapp")
            shared?.setValue(encoded, forKey: "favGames")
        }
    }
    
    static func decodeGamesToDefaults() -> [Game] {
        var favouriteGames = [Game]()
        let shared = UserDefaults(suiteName: "group.gmapp")
        if let favGames = try? shared?.object(forKey: "favGames") as? Data {
            let decoder = JSONDecoder()
            if let loadedGames = try? decoder.decode([Game].self, from: favGames) {
                Logger.shared.log("Loaded games for UserDefaults: \(loadedGames.count)")
                favouriteGames = loadedGames
            }
        }
        return favouriteGames
    }
    
    
}
