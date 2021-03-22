//
//  FavouriteGames.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 22/03/2021.
//

import Foundation
import SwiftUI

class FavouriteGames : ObservableObject {
    @Published var games = [Game]()
}
