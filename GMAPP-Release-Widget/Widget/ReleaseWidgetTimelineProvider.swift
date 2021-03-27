//
//  ReleaseWidgetTimelineProvider.swift
//  GMAPP-Release-WidgetExtension
//
//  Created by Lukasz Stachnik on 27/03/2021.
//

import WidgetKit
import SwiftUI
import Intents

struct ReleaseWidgetTimelineProvider: IntentTimelineProvider {
    
    func placeholder(in context: Context) -> ReleaseWidgetEntry {
        ReleaseWidgetEntry(date: Date(), configuration: ConfigurationIntent(), favGame: [Game.example])
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (ReleaseWidgetEntry) -> ()) {
        let entry = ReleaseWidgetEntry(date: Date(), configuration: configuration, favGame: [Game.example])
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<ReleaseWidgetEntry>) -> ()) {
        
        var entries: [ReleaseWidgetEntry] = []
        
        let favGames = FavouriteGames.decodeGamesToDefaults()
        
        let refreshDate = Calendar.current.date(byAdding: .minute,value: 15, to: Date())!
        let entry = ReleaseWidgetEntry(date: Date(), configuration: configuration, favGame: favGames)
        entries.append(entry)

        let timeline = Timeline(entries: entries, policy: .after(refreshDate))
        completion(timeline)
    }
}
