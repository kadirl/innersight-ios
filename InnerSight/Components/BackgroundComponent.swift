//
//  BackgroundComponent.swift
//  InnerSight
//
//  Created by Kadir on 28.07.2023.
//

import Foundation
import SwiftUI

struct BackgroundComponent<Content: View>: View {
    let content: Content
    var starsOpacity: Double

    init(starsOpacity: Double = 1.0, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.starsOpacity = starsOpacity
    }

    var body: some View {
        ZStack (alignment: .top){
            // Background
            ZStack (alignment: .top) {
                ZStack {
                    Circle()
                        .frame(width: 600, height: 600)
                        .foregroundColor(Color(red: 0, green: 0.11, blue: 1))
                    Circle()
                        .frame(width: 300, height: 300)
                        .foregroundColor(Color(red: 0.55, green: 1, blue: 0))
                }
                .blur(radius: 165)
                .offset(x: 0, y: -300)
                .frame(maxWidth: UIScreen.main.bounds.width)
                
                
                Image("BackgroundStars")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .opacity(starsOpacity)
                

            }
//            .frame(maxWidth: .infinity)
//            .ignoresSafeArea()
            
            
            // Overlay content
            content
        }
//        .frame(maxWidth: .infinity)
    }
}

struct BackgroundComponent_Preview: PreviewProvider {
    static var previews: some View {
        BackgroundComponent() {
            Text("Hello")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .preferredColorScheme(.dark)
    }
}

