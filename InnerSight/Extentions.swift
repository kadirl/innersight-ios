//
//  Extentions.swift
//  InnerSight
//
//  Created by Kadir on 28.07.2023.
//

import Foundation
import SwiftUI

struct VisualEffect: UIViewRepresentable {
    @State var style : UIBlurEffect.Style
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
    }
}
