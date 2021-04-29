//
//  GameRowLifting.swift
//  GMAPP
//
//  Created by Łukasz Stachnik on 06/04/2021.
//

import SwiftUI

struct GameRowLifting: View {
    
    let game : Game
    @EnvironmentObject var fav: FavouriteGames
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(LinearGradient(
                                gradient: Gradient(colors: [.purple, .black]) ,
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)
                        )
                    VStack {
                        Text("\(game.score)")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                .frame(width: 70, height: 70, alignment: .center)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(game.title)
                            .font(.headline)
                            .fontWeight(.bold)
                            .lineLimit(2)
                            .padding(.bottom, 5)

                        HStack {
                            Text(game.developer)
                                
                            Text(game.formattedDate)
                        }.padding(.bottom, 5)
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack {
                                ForEach(game.genres, id: \.self) { genre in
                                    GenreBlob(genreName: genre)
                                }
                            }
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
                }
            }
        }
    }
}

struct GameRowLifting_Previews: PreviewProvider {
    static var previews: some View {
        GameRowLifting(game: Game.example)
            .environmentObject(FavouriteGames())
    }
}
