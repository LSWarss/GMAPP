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
    
    
    static let example = Game(id: 12312, title: "Mass Effect Andromeda", platform: "PC", release_date: "2021-05-14T00:00:00.000Z")

    
    
}


