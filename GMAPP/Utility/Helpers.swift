//
//  Helpers.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 18/03/2021.
//

import Foundation


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

}
