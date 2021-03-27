//
//  ReleaseWidgetEntryView.swift
//  GMAPP-Release-WidgetExtension
//
//  Created by Lukasz Stachnik on 27/03/2021.
//

import SwiftUI
import WidgetKit
import Intents

struct ReleaseWidgetEntryView: View {
    var entry: ReleaseWidgetTimelineProvider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}

struct ReleaseWidgetEntryViewPreview: PreviewProvider {
    static var previews: some View {
        ReleaseWidgetEntryView(entry: ReleaseWidgetEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
