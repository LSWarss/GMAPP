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
        .padding()
       
    }
}

struct GameReleaseView_Previews: PreviewProvider {
    static var previews: some View {
        GameReleaseView(entry: ReleaseWidgetEntry(date: Date(), configuration: ConfigurationIntent(), favGame: [Game.example]))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        GameReleaseView(entry: ReleaseWidgetEntry(date: Date(), configuration: ConfigurationIntent(), favGame: [Game(id: 1, title: "KATORGANATORSKIasdadsadasdsadasdasdasdasdasdasdas", platform: "PC", release_date: "2021-05-14T00:00:00.000Z", description: "Mass Effect: Legendary Edition is a compilation of the video games in the original Mass Effect trilogy: Mass Effect, Mass Effect 2, and Mass Effect 3. It is being developed by BioWare with assistance from Abstraction Games and Blind Squirrel Games, and published by Electronic Arts. All three games were remastered, with visual enhancements, technical improvements, and gameplay adjustments.", genres: ["RPG","Shooter"], developer: "BioWare", score: "tbd")]))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
