//
//  HomeView.swift
//  InnerSight
//
//  Created by Kadir on 28.07.2023.
//

import SwiftUI

struct HomeView: View {
    @State private var favoriteColor = 0
    
    let HomeVM = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("")
                    .navigationTitle(HomeVM.getGreetingTitle())
                
                Picker("What is your favorite color?", selection: $favoriteColor) {
                                Text("Week").tag(0)
                                Text("Month").tag(1)
                                Text("Year").tag(2)
                            }
                            .pickerStyle(.segmented)
                            .padding(.bottom, 8)
                
                Image("chart")
                    .padding(.bottom, 8)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Tip of the day")
                        .font(.footnote)
                        .bold()
                        .textCase(.uppercase)
                        .foregroundColor(.secondary)
                        .padding([.leading, .top], 12)
                    
                    Text("Eat more fruits & vegetables")
                        .font(.title3)
                        .bold()
                        .padding([.leading, .trailing], 12)
                    
                    Text("It had been scientifically proven that fruits & vegetables may boost your productivity")
                        .padding([.leading, .trailing], 12)
                        .padding(.bottom, 6)
                    
                    Button {
                        
                    } label: {
                        Text("Next tip")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                    .tint(.secondary)
                    .foregroundColor(.white)
                    .padding([.leading, .trailing, .bottom], 12)
                    .cornerRadius(12)
                }
                .background(VisualEffect(style: .systemUltraThinMaterial))
                .cornerRadius(10)
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding([.leading, .trailing])
            .background(StarsBackground(starsOpacity: 0.5, colorOpacity: 1), alignment: .top)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
