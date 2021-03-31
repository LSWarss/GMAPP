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
            VStack {
                Text(game.title)
                    .font(.largeTitle)
                    .padding(10)
                ZStack(alignment: .top ){
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color("OffWhite"))
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y:10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    VStack{
                        Text(game.platform)
                            .padding(.top, 20)
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
                    .padding()
                }.ignoresSafeArea()
            }.padding(.top, 100)
        }
        .background(Color("OffWhite"))
        .ignoresSafeArea()
    }
}

struct GameDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailsView(game: Game.example)
    }
}
