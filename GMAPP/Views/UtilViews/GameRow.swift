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
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color("OffWhite"))
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y:10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
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
                Spacer()
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
                .foregroundColor(fav.games.contains(where: {$0.id == game.id}) ? Color("AccentColor") : .primary)
                .padding(.horizontal, 20)
                .scaleEffect(fav.games.contains(where: {$0.id == game.id}) ? 1.2 : 1.0 )
                .animation(.easeOut)
            }.frame(minHeight: 60)
        }
    }
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        GameRow(game: Game.example)
            .environmentObject(FavouriteGames())
    }
}
