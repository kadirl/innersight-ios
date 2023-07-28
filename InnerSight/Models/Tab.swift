//
//  Tab.swift
//  InnerSight
//
//  Created by Kadir on 28.07.2023.
//

import Foundation

struct Tab: Identifiable, Hashable {
    var id = UUID().uuidString
    var icon: String
    var title: String
    var description: String
}
