//
//  Genres.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 01/04/2021.
//

import Foundation



class Genres : ObservableObject {
    @Published var list = [Genre]()
    
    init() {
        GameService().getGenres(completion: { result in
            switch result {
            case .success(let genres):
                DispatchQueue.main.async {
                   
                    self.list = genres
                }
            case .failure(_):
                self.list = [Genre.example]
            }
        })
    }
}
