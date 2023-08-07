//
//  User.swift
//  InnerSight
//
//  Created by Kadir on 28.07.2023.
//

import Foundation
import RealmSwift


class GoalM: EmbeddedObject {
    @Persisted var icon: String
    @Persisted var name: String
    @Persisted var desc: String
    @Persisted var selected: Bool
}


class User: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var username: String = ""
    @Persisted var age: Int = 13
    @Persisted var goals: List<GoalM>
}
