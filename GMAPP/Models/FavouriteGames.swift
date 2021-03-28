//
//  FavouriteGames.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 22/03/2021.
//

import Foundation
import SwiftUI
import UserNotifications

class FavouriteGames : ObservableObject {
    
    @Published var games = [Game]()
    
    init() {
        games = FavouriteGames.decodeGamesToDefaults()
        
    }
    
    func appendGame(game: Game) {
        games.append(game)
        encodeGamesToDefaults(games: games)
        Helpers.refreshWidgetData()
        scheduleGameReleaseNotification(game: game
        )
    }
    
    func removeGame(game: Game) {
        if let index = games.firstIndex(where: {$0.id == game.id}) {
            games.remove(at: index)
            encodeGamesToDefaults(games: games)
            Helpers.refreshWidgetData()
            removeGameReleaseNotification(game: game)
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
    
    /**
        Schedules notification on games release day
     */
    fileprivate func scheduleGameReleaseNotification(game : Game) {
        let triggerDate = Calendar.current.date(byAdding: .day, value: Helpers.daysUntil(until: Helpers.postgresDateToDateConverter(from: game.formattedDate)), to: Date())!
        let comps = Calendar.current.dateComponents([.year,.month, .day], from:triggerDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: comps, repeats: false)
        
        let content = UNMutableNotificationContent()
        content.title = "It's today!"
        content.subtitle = "\(game.title) for \(game.platform) releases today! 🔥"
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: String(game.id), content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        
        Logger.shared.log("Scheduled notification for game: \(game.title)")
    }
    
    fileprivate func removeGameReleaseNotification(game: Game){
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: [String(game.id)])
        Logger.shared.log("Removed notification for game: \(game.title)")
    }
    
}
