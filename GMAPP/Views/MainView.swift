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
            GamesView()
                .tabItem {
                    Label("", systemImage: "gamecontroller.fill")
                }
            FilteringGamesView()
                .tabItem {
                    Label("", systemImage: "magnifyingglass")
                }
            FavouriteGamesView()
                .tabItem {
                    Label("", systemImage: "bolt.heart.fill")
                }
            
        }
    }
}
