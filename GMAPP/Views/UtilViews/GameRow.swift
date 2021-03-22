//
//  GameRow.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 18/03/2021.
//

import SwiftUI

/**
 Custom row for list of games
 */
struct GameRow: View {
    
    let game : Game
    @EnvironmentObject var fav: FavouriteGames
    @State private var isFav = false
    var body: some View {
        HStack {
            Image(systemName: "gamecontroller")
                .padding()
                .scaleEffect(1.5)
                .scaledToFill()
            VStack(alignment: .leading) {
                Text(game.title)
                    .font(.title3)
                    .bold()
                HStack {
                    Text(game.formattedDate)
                    Text(game.platform)
                }
            }
            
//            Image(systemName: "star")
//                .padding()
//                .scaleEffect(1.5)
//                .scaledToFill()
//                .onTapGesture {
//                    self.foregroundColor(Color.green)
//                    fav.games.append(self.game)
//                    Logger.shared.log("Added game to fav: \(self.game.title)")
//                    Logger.shared.log("Number of fav's right now: \(fav.games.count)")
//                }
            Toggle("🔥", isOn: $isFav)
        }
    }
    
    private func addToFav(game: Game){
        
    }
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        GameRow(game: Game.example)
    }
}
