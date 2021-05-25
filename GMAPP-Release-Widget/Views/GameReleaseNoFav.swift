//
//  GameReleaseNoFav.swift
//  GMAPP-Release-WidgetExtension
//
//  Created by Lukasz Stachnik on 27/03/2021.
//

import SwiftUI
import WidgetKit

struct GameReleaseNoFav: View {
    var body: some View {
        VStack{
            Text("You don't have any fav 🎮 added to list yet")
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
            Button("Click to Add"){
                
            }
            .padding(8)
            .background(Color("AccentColor"))
            .foregroundColor(.primary)
            .cornerRadius(8.0)
            
        }
        .padding()
    }
}

struct GameReleaseNoFav_Previews: PreviewProvider {
    static var previews: some View {
        GameReleaseNoFav()
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
