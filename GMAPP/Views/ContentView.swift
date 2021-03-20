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
    @State private var resultVisibile = false
    
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
                    self.resultVisibile = false
                    GameService().getGames(platform: platform, completion: { result in
                        switch result {
                        case .success(let games):
                            self.games = games.filter { game in
                                self.resultVisibile = true
                                return Helpers.postgresDateToDateConverter(from: game.formattedDate) > Date()
                            }
                        case .failure(_):
                            self.games = [Game.example]
                        }
                    })
                }
                .onChange(of: platform, perform: { platform in
                    self.resultVisibile = false
                    GameService().getGames(platform: platform, completion: { result in
                        switch result {
                        case .success(let games):
                            self.games = games.filter { game in
                                self.resultVisibile.toggle()
                                return Helpers.postgresDateToDateConverter(from: game.formattedDate) > Date()
                            }
                            self.resultVisibile = true
                        case .failure(_):
                            self.games = [Game.example]
                        }
                    })
                })
                
            }
            if(resultVisibile == false){
                Color.white
                    .edgesIgnoringSafeArea(.all)
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
