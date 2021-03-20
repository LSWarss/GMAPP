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
    
    var body: some View {
        HStack {
            Image(systemName: "gamecontroller")
                .padding()
                .scaledToFill()
            VStack(alignment: .leading) {
                Text(game.title)
                    .font(.callout)
                HStack {
                    Text(game.formattedDate)
                    Text(game.platform)
                }
            }
        }
    }
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        GameRow(game: Game.example)
    }
}
