//
//  GMAPPApp.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 18/03/2021.
//

import SwiftUI
import CoreData

@main
struct GMAPPApp: App {
    
    @StateObject var favGames = FavouriteGames()
    // This handle lifeccycle of  object
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(favGames)
        }
    }
    
}
