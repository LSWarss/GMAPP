//
//  ContentView.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 18/03/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var games = [Game]()
    @State private var platform = "PC"
    
    var body: some View {
        ZStack{
            NavigationView {
                List(games) { game in
                    NavigationLink(
                        destination: GameDetailsView(game: game)){
                        GameRow(game: game)
                    }
                }.navigationTitle("Games")
                .toolbar {
                        Picker("Platform", selection: $platform) {
                            ForEach(Constants.platformTypes, id: \.self){
                                Text($0)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
    
                }
                .onAppear() {
                    GameService().getGamesForPlatform(platform: platform, completion: { (games) in
                        self.games = games.filter { game in
                            return Helpers.postgresDateToDateConverter(from: game.formattedDate) > Date()
                        }
                    })
                }
                .onChange(of: platform, perform: { platform in
                    GameService().getGamesForPlatform(platform: platform, completion: { (games) in
                        self.games = games.filter { game in
                            return Helpers.postgresDateToDateConverter(from: game.formattedDate) > Date()
                        }
                    })
                })
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
