//
//  FilteringGamesView.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 01/04/2021.
//

import SwiftUI

struct FilteringGamesView: View {
    
    //MARK: State Objects
    @State private var isPresented = false
    @State private var gameTitle : String = ""
    @State private var genreIndex = 0
    
    //MARK: Environment Objects
    @EnvironmentObject var games : Games
    @EnvironmentObject var genres : Genres
    @Environment(\.presentationMode) var presentationMode
    
    
    
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
                    isPresented.toggle()
                }).sheet(isPresented: $isPresented, content: {
                    if gameTitle.isEmpty {
                        NavigationView {
                        List {
                            ForEach(games.list.filter { game in
                                return game.genres.contains(genres.list[genreIndex].genre)
                            }) { game in
                                GameRowLifting(game: game)
                                    .background(NavigationLink(destination: GameDetailsView(game: game)){})
                            }
                        }
                        .navigationTitle(genres.list[genreIndex].genre)
                        }
                    } else {
                        GameDetailsView(game: games.list.filter{ $0.title.contains(gameTitle)}.first ?? Game.example)
                    }
                })
            }
        }
    }
}

struct FilteringGamesView_Previews: PreviewProvider {
    static var previews: some View {
        FilteringGamesView()
            .environmentObject(FavouriteGames())
            .environmentObject(Genres())
    }
}
