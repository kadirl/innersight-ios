//
//  HomeView.swift
//  InnerSight
//
//  Created by Kadir on 28.07.2023.
//

import SwiftUI

struct HomeView: View {
    @State private var favoriteColor = 0
    
    var body: some View {
        NavigationView {
            BackgroundComponent (starsOpacity: 0.5) {
                VStack(alignment: .leading) {
                    Text("")
                        .navigationTitle("Fuck me")
                    
                    Picker("What is your favorite color?", selection: $favoriteColor) {
                                    Text("Red").tag(0)
                                    Text("Green").tag(1)
                                    Text("Blue").tag(2)
                                }
                                .pickerStyle(.segmented)
//                                .background(VisualEffect(style: .systemUltraThinMaterial))
                    
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
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
