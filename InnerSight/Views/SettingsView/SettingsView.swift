//
//  Settings.swift
//  InnerSight
//
//  Created by Kadir on 05.08.2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                Section (header: Text("")){
                    NavigationLink (
                        destination: GoalsSettingsView(),
                        label: {Text("My goals")}
                    )
                    .listRowBackground(
                        Rectangle()
                            .fill(.thinMaterial)
                            .blendMode(.luminosity)
                    )
                    
                    Link(
                        "Privacy Policy",
                        destination: URL(string: "https://www.apple.com")!
                    )
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .listRowBackground(
                        Rectangle()
                            .fill(.thinMaterial)
                            .blendMode(.luminosity)
                    )
                    
                    Link(
                        "Terms of Use",
                        destination: URL(string: "https://www.apple.com")!
                    )
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    .listRowBackground(
                        Rectangle()
                            .fill(.thinMaterial)
                            .blendMode(.luminosity)
                    )
                    
                    .listRowBackground(
                        Rectangle()
                            .fill(.thinMaterial)
                            .blendMode(.luminosity)
                    )
                }
                
                Button (role: .destructive) {
                    
                } label: {
                    HStack {
                        Image(systemName: "trash.fill")
                        Text("Delete all data")
                    }
                }
                .listRowBackground(
                    Rectangle()
                        .fill(.thinMaterial)
                        .blendMode(.luminosity)
                )
            }
            .listStyle(InsetGroupedListStyle())
            .scrollContentBackground(.hidden)
            .background(
                StarsBackground(starsOpacity: 0.0, colorOpacity: 0.5),
                alignment: .top
            )
            .navigationTitle("Settings")
        }
    }
}

    
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
