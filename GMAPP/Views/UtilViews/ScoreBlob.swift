//
//  ScoreBlob.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 31/03/2021.
//

import SwiftUI

struct ScoreBlob: View {
    
    var score : String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(Color("OffWhite"))
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y:10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            Text(score)
                .fontWeight(.semibold)
                
        }
        .frame(maxWidth: 150, maxHeight: 75)
    }
}

struct ScoreBlob_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBlob(score: "To be discovered")
    }
}
