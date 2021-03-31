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
    let description : String
    let genre : String
    let developer : String
    let score: String
    
    var formattedDate : String {
        let release_array = release_date.split(separator: "-")
        return String(release_array[0] + "-" + release_array[1] + "-" + release_array[2].prefix(2))
    }
    
    var formattedScore : String {
        return score == "tbd" ? "To be discovered" : score
    }
    
    
    static let example = Game(id: 12312, title: "Mass Effect Andromeda", platform: "PC", release_date: "2021-05-14T00:00:00.000Z", description: "Mass Effect: Legendary Edition is a compilation of the video games in the original Mass Effect trilogy: Mass Effect, Mass Effect 2, and Mass Effect 3. It is being developed by BioWare with assistance from Abstraction Games and Blind Squirrel Games, and published by Electronic Arts. All three games were remastered, with visual enhancements, technical improvements, and gameplay adjustments.", genre: "RPG", developer: "BioWare", score: "tbd")

    
    
}


