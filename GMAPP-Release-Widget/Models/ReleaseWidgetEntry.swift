//
//  ReleaseWidgetEntry.swift
//  GMAPP-Release-WidgetExtension
//
//  Created by Lukasz Stachnik on 27/03/2021.
//

import Foundation
import WidgetKit


struct ReleaseWidgetEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let favGame : [Game]
}
