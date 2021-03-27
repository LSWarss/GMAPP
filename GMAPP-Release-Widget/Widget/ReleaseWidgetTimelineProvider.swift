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
        ReleaseWidgetEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (ReleaseWidgetEntry) -> ()) {
        let entry = ReleaseWidgetEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<ReleaseWidgetEntry>) -> ()) {
        var entries: [ReleaseWidgetEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = ReleaseWidgetEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
