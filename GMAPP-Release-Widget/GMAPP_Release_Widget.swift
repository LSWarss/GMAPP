//
//  GMAPP_Release_Widget.swift
//  GMAPP-Release-Widget
//
//  Created by Lukasz Stachnik on 26/03/2021.
//

import WidgetKit
import SwiftUI
import Intents

@main
struct GMAPP_Release_Widget: Widget {
    let kind: String = "GMAPP_Release_Widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: ReleaseWidgetTimelineProvider()) { entry in
            ReleaseWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("GMAPP Release Date Widget")
        .description("This is the widget that shows you how long until your fav game premiere.")
    }
}
