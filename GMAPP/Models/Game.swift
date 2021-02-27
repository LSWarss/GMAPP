//
//  Game.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 27/02/2021.
//

import Foundation

struct Game: Codable, Identifiable {
    let id = UUID()
    let title : String
    let platform : String
    let release_date : String
}

