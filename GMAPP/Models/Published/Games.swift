//
//  Games.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 01/04/2021.
//

import Foundation


class Games : ObservableObject {
    @Published var list = [Game]()
    
    init() {
        GameService().getGames(completion: { result in
            switch result {
            case .success(let games):
                DispatchQueue.main.async {
                   
                    self.list = games.filter { game in
                        return Helpers.postgresDateToDateConverter(from: game.formattedDate) > Date()
                    }
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self.list = [Game.example]
                }
            }
        })
    }
}
