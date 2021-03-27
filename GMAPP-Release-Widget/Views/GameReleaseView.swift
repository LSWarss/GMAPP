//
//  GameReleaseView.swift
//  GMAPP-Release-WidgetExtension
//
//  Created by Lukasz Stachnik on 27/03/2021.
//

import SwiftUI
import WidgetKit

struct GameReleaseView: View {
    
    let entry : ReleaseWidgetEntry
    
    var body: some View {
        VStack{
            Text(entry.favGame[0].title)
                .font(.title3)
                .bold()
                .padding(.bottom, 10)
            Helpers.releaseDaysText(game: entry.favGame[0])
                .multilineTextAlignment(.center)
        }
       
    }
}

struct GameReleaseView_Previews: PreviewProvider {
    static var previews: some View {
        GameReleaseView(entry: ReleaseWidgetEntry(date: Date(), configuration: ConfigurationIntent(), favGame: [Game.example]))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
