//
//  MainView.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 22/03/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Games", systemImage: "gamecontroller.fill")
                }
            FavouriteGamesView()
                .tabItem {
                    Label("Fav", systemImage: "bolt.heart.fill")
                }
        }
    }
}
