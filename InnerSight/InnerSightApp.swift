//
//  InnerSightApp.swift
//  InnerSight
//
//  Created by Kadir on 19.07.2023.
//

import SwiftUI

@main
struct InnerSightApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(hasSignedUp: false)
                .preferredColorScheme(.dark)
        }
    }
}
