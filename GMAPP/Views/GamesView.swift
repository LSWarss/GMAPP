//
//  ContentView.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 18/03/2021.
//

import SwiftUI

struct GamesView: View {
    
    @EnvironmentObject var games : Games
    @State private var platform = "PC"
    var body: some View {
        
        ZStack{
            NavigationView {
                List(games.list.filter{ game in
                    return game.platform == platform
                    
                }) { game in
                    GameRowLifting(game: game)
                        .background(NavigationLink(destination: GameDetailsView(game: game)){})
                }
                .navigationTitle("Games")
                .toolbar {
                        Picker("Platform", selection: $platform) {
                            ForEach(Constants.platformTypes, id: \.self){
                                Text($0)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                }
            }
            if(games.list.isEmpty){
                Color(UIColor.systemBackground)
                    .edgesIgnoringSafeArea(.all)
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("AccentColor"))
                    )
                    .scaleEffect(1, anchor: .center)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
            .preferredColorScheme(.light)
            .previewDevice("iPhone 12")
            .environmentObject(FavouriteGames())
            .environmentObject(Games())
            .environmentObject(Genres())
    }
}
