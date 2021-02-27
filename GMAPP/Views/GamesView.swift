//
//  ContentView.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 27/02/2021.
//

import SwiftUI

struct GamesView: View {
    
    @State var games: [Game] = []
    
    var body: some View {
        List(games) { game in
            Text(game.title)
                .font(.headline)
            Text(game.platform)
                .font(.subheadline)
        }.onAppear {
            GamesViewModel().getGames{
                (games) in
                self.games = games
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
