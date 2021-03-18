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

}
