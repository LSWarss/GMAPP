//
//  Game.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 18/03/2021.
//

import Foundation


import Foundation

struct Game : Codable, Identifiable {
    var id : Int
    let title : String
    let platform : String
    let release_date : String
    
    var formattedDate : String {
        let release_array = release_date.split(separator: "-")
        return String(release_array[0] + "-" + release_array[1] + "-" + release_array[2].prefix(2))
    }
    
    #if DEBUG
    static let example = Game(id: 12312, title: "Mass Effect Andromeda", platform: "PC", release_date: "2021-05-14T00:00:00.000Z")
    #endif
    
    static func encodeGamesToDefaults(games: [Game]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(games) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "favGames")
        }
    }
    
    static func decodeGamesToDefaults() -> [Game] {
        var favouriteGames = [Game]()
        let defaults = UserDefaults.standard
        if let favGames = try? defaults.object(forKey: "favGames") as? Data {
            let decoder = JSONDecoder()
            if let loadedGames = try? decoder.decode([Game].self, from: favGames) {
                Logger.shared.log("Loaded games for UserDefaults: \(loadedGames.count)")
                favouriteGames = loadedGames
            }
        }
        return favouriteGames ?? [Game.example]
    }
    
}


