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
            Color(UIColor.systemBackground)
            VStack{
                Text(game.title)
                    .font(.title)
                    .fontWeight(.black)
                
                ZStack{
                    VStack{
                        HStack(alignment: .center, spacing: 0) {
                            Text("\(game.genres[0]) ")
                                .fontWeight(.bold)
                            Text("- \(game.platform)")
                        }
                        Text(Helpers.postgresDateToDateConverter(from: game.formattedDate), style: .date)
                        Helpers.releaseDaysText(game: game)
                        Text(game.description)
                            .padding()
                            .font(.body)
                            .lineLimit(18)
                        HStack() {
                            Text("Users score: ")
                            Text(game.formattedScore)
                                .bold()
                        }
                    }.padding()
                    .background(RoundedRectangle(cornerRadius: 25.0)
                                    .fill(Color("OffWhite"))
                                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y:10)
                                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                                    .frame(minWidth: 350,maxHeight: 550))
                }
            }.padding()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct GameDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameDetailsView(game: Game.example)
                .preferredColorScheme(.dark)
        }
    }
}
