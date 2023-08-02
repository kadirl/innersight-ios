//
//  StartView.swift
//  InnerSight
//
//  Created by Kadir on 28.07.2023.
//

import SwiftUI


//class RegistrationData: ObservableObject {
//    @Published var username: String = ""
//    @Published var dob: String = ""
//    @Published var goals: Array<String> = []
//}


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
    @State private var isNextViewActive = false
    
    var body: some View {
        NavigationStack {
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
                PageControl(currentPageIndex: currentIndex, numberOfPages: 3)
                    .disabled(true)
                
                VStack(spacing: 16) {
                    Button {
                        isNextViewActive = true
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
            .background(
                NavigationLink(
                    destination: NameView(),
                    isActive: $isNextViewActive,
                    label: { EmptyView() }
                )
            )
            .background(
                StarsBackground(starsOpacity: 1, colorOpacity: 1),
                alignment: .top
            )
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
            .preferredColorScheme(.dark)
    }
}
