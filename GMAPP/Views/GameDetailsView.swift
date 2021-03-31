//
//  GameDetailsView.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 18/03/2021.
//

import SwiftUI

struct GameDetailsView: View {
    
    var game : Game
    
    var body: some View {
        ZStack {
            Color("OffWhite")
            VStack{
                Text(game.title)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding(10)
                ZStack{
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color("OffWhite"))
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y:10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        .frame(minWidth: 350, maxHeight: 550)
                    
                    VStack{
                        HStack(alignment: .center, spacing: 0) {
                            Text("\(game.genre) ")
                                .fontWeight(.bold)
                            Text("- \(game.platform)")
                        }
                        Text(Helpers.postgresDateToDateConverter(from: game.formattedDate), style: .date)
                        Helpers.releaseDaysText(game: game)
                        Text(game.description)
                            .padding()
                            .font(.body)
                        HStack() {
                            Text("Users score: ")
                            Text(game.formattedScore)
                                .bold()
                        }
                    }
                }
            }.padding()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct GameDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailsView(game: Game.example)
    }
}
