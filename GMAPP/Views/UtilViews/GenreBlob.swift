//
//  GenreBlob.swift
//  GMAPP
//
//  Created by Łukasz Stachnik on 06/04/2021.
//

import SwiftUI

struct GenreBlob: View {
    var genreName: String
       var fontSize: CGFloat = 12.0
    var body: some View {
        ZStack {
                    Text(genreName)
                        .font(.system(size: fontSize, weight: .regular))
                        .lineLimit(2)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color.random)
                        .cornerRadius(5)
                }
    }
}

