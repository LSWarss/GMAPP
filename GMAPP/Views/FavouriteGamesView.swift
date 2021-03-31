//
//  FavouriteGamesView.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 22/03/2021.
//

import SwiftUI

struct FavouriteGamesView: View {
    
    @EnvironmentObject var fav: FavouriteGames
    
    var body: some View {
        NavigationView {
            List(fav.games){ game in
                NavigationLink(
                    destination: GameDetailsView(game: game)){
                    GameRow(game: game)
                }
            }.navigationTitle("Favourites")
        }
    }
}

struct FavouriteGamesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteGamesView()
            .environmentObject(FavouriteGames())
    }
}
