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
                if Helpers.daysUntil(until: Helpers.postgresDateToDateConverter(from: game.formattedDate)) > 0 {
                    Text("Days until premiere: \(Helpers.daysUntil(until: Helpers.postgresDateToDateConverter(from: game.formattedDate)))")
                }
                else if (Helpers.daysUntil(until: Helpers.postgresDateToDateConverter(from: game.formattedDate)) == 0) {
                    Text("It's today! 🔥")
                }
                else {
                    Text("It's here! 👏🏻")
                }
                
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct GameDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailsView(game: Game.example)
    }
}
