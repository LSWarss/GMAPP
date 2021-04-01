//
//  FilteringGamesView.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 01/04/2021.
//

import SwiftUI

struct FilteringGamesView: View {
    
    //MARK: State Objects
    @State private var showingFilterSheet = false
    @State private var gameTitle : String = ""
    @State private var genreIndex = 0
    
    //MARK: Environment Objects
    @EnvironmentObject var games : Games
    @EnvironmentObject var genres : Genres
    
    var body: some View {
        NavigationView() {
            Form() {
                TextField("Game title", text: $gameTitle)
                Picker(selection: $genreIndex, label: Text("Genres")) {
                    ForEach(0 ..< genres.list.count) {
                        Text(self.genres.list[$0].genre)
                    }
                }
                Button("Show games", action: {
                    showingFilterSheet.toggle()
                }).sheet(isPresented: $showingFilterSheet, content: {
                    if gameTitle.isEmpty {
                        List(games.list.filter{ game in
                            return game.genre == genres.list[genreIndex].genre
                        }) { game in
                        GameRow(game: game)
                            .background(NavigationLink(destination: GameDetailsView(game: game)){})
                    }.padding(0)
                    } else {
                        GameDetailsView(game: games.list.filter{ $0.title == gameTitle}.first ?? Game.example)
                    }
                })
            }
        }
    }
}

struct FilteringGamesView_Previews: PreviewProvider {
    static var previews: some View {
        FilteringGamesView()
    }
}
