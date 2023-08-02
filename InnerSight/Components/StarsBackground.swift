//
//  Background.swift
//  InnerSight
//
//  Created by Kadir on 02.08.2023.
//

import SwiftUI

struct StarsBackground: View {
    var starsOpacity: Double
    var colorOpacity: Double
    
    init(starsOpacity: Double = 1.0, colorOpacity: Double = 1.0) {
        self.starsOpacity = starsOpacity
        self.colorOpacity = colorOpacity
    }
    
    var body: some View {
        ZStack (alignment: .top){
            Circle()
                .fill(Color(red: 0, green: 0.11, blue: 1))
                .overlay(
                    Circle()
                        .frame(width: 300, height: 300)
                        .foregroundColor(Color(red: 0.55, green: 1, blue: 0))
                )
                .frame(width: 600, height: 600)
                .offset(x: 0, y: -250)
                .blur(radius: 165)
                .opacity(colorOpacity)
            
            Image("BackgroundStars")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: UIScreen.main.bounds.width)
                .opacity(starsOpacity)
        }
        .ignoresSafeArea()
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        StarsBackground()
    }
}
