//
//  StartView.swift
//  InnerSight
//
//  Created by Kadir on 28.07.2023.
//

import SwiftUI

struct StartView: View {
    
    @State var tabs: [Tab] = [
        Tab(
            icon: "sparkles",
            title: "Weekly & Monthly Wellbeing Reports",
            description: "Gain valuable insights into your mood and emotional health over time."
        ),
        Tab(
            icon: "message.and.waveform.fill",
            title: "Effortless Mood Tracking",
            description: "Share emotions via chat or voice, and automatically monitor your wellbeing."
        ),
        Tab(
            icon: "face.smiling",
            title: "Personalized Happiness Tips",
            description: "Unlock a happier life with tailored tips for your unique journey."
        )
    ]
    
    @State var currentIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 8) {
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 16) {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 32)
                
                Text("Start Your Journey\ninto Emotional Awareness")
                    .font(.largeTitle)
                    .bold()
                
                Text("App built to make you happier!")
                    .foregroundColor(.secondary)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding()
            
            InfiniteCarouselView(tabs: $tabs, currentIndex: $currentIndex)
            
            VStack(spacing: 16) {
                Button {
                    
                } label: {
                    Text("Start")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .tint(.indigo)
                .foregroundColor(.white)
                
                Text("By continuing, you agree to our [Terms of Service](https://example.com)")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .accentColor(.indigo)
                    .multilineTextAlignment(.center)
            }
            .padding()
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
            .preferredColorScheme(.dark)
    }
}
