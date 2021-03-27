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
        ZStack{
            VStack {
                Text(game.title)
                    .font(.largeTitle)
                Text(game.platform)
                Text(Helpers.postgresDateToDateConverter(from: game.formattedDate), style: .date)
                Helpers.releaseDaysText(game: game)
                
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct GameDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailsView(game: Game.example)
    }
}
