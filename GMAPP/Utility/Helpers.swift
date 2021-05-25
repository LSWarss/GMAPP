//
//  Helpers.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 18/03/2021.
//

import Foundation
import WidgetKit
import SwiftUI

class Helpers {
    
    static func createUrl(baseComponents: URLComponents, pathParams: [String]?) -> URL? {
        var components = baseComponents
        var placeholderPath = baseComponents.path
        
        if let pathparams = pathParams {
            for path in pathparams {
                placeholderPath =  placeholderPath + "\(path)"
            }
            components.path = placeholderPath
        }
        
        guard let url = components.url else {
            return URL(string:"")!
        }
        
        return url
    }
    
    /**
        Converts date in postgres format from GMAPI to Date format
     */
    static func postgresDateToDateConverter(from date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let returnDate = dateFormatter.date(from: date) else {
            print("Wrong conversion ❌")
            return Date()
        }
        
        return returnDate
    }
    
    static func daysUntil(until date: Date) -> Int {
        let userDate = Calendar.current.dateComponents([.day, .month, .year], from: date)
            
        let userDateComponents = DateComponents(calendar: Calendar.current, year: userDate.year!, month: userDate.month!, day: userDate.day!).date!
            
        let daysUntil = Calendar.current.dateComponents([.day], from: Date(), to: userDateComponents)
            
        return daysUntil.day!
    }
    
    static func refreshWidgetData() {
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    static func releaseDaysText(game : Game) -> Text {
        if Helpers.daysUntil(until: Helpers.postgresDateToDateConverter(from: game.formattedDate)) > 0 {
            return Text("Days until premiere: \(Helpers.daysUntil(until: Helpers.postgresDateToDateConverter(from: game.formattedDate)))")
                .bold()
        }
        else if (Helpers.daysUntil(until: Helpers.postgresDateToDateConverter(from: game.formattedDate)) == 0) {
            return Text("It's today! 🔥")
                .bold()
        }
        else {
            return Text("It's here! 👏🏻")
                .bold()
        }
    }
    
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
  
