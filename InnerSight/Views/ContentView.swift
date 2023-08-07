//
//  ContentView.swift
//  InnerSight
//
//  Created by Kadir on 28.07.2023.
//

import SwiftUI

struct ContentView: View {
    var hasSignedUp: Bool
    
    var body: some View {
        
//        var hasSignedUp = UserDefaults.standard.bool(forKey: "hasSignedUp")
        
        
        if hasSignedUp {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                
                HomeView()
                    .tabItem {
                        Label("Journal", systemImage: "list.clipboard.fill")
                    }
                
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        } else {
            StartView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(hasSignedUp: false)
            .preferredColorScheme(.dark)
    }
}
