//
//  GMAPPApp.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 18/03/2021.
//

import SwiftUI

@main
struct GMAPPApp: App {
    // This handle lifeccycle of  object
    @StateObject var fav = FavouriteGames()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(fav)
        }
    }
}
