//
//  ContentView.swift
//  InnerSight
//
//  Created by Kadir on 28.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        var hasRegistered = UserDefaults.standard.bool(forKey: "hasRegistered")
        
        if hasRegistered {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
            }
        } else {
            StartView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
