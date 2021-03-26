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
    @State private var scale: CGFloat = 1
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
            
            Button(action: {}){
                Image(systemName: fav.games.contains(where: {$0.id == game.id}) ? "star.fill" : "star")
                    .onTapGesture {
                        if fav.games.contains(where: {$0.id == game.id}) {
                            fav.removeGame(game: self.game)
                            Logger.shared.log("Removed game from fav: \(self.game.title)")
                        } else {
                            fav.appendGame(game: self.game)
                            Logger.shared.log("Added game to fav: \(self.game.title)")
                        }
                    }
            }
            
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
