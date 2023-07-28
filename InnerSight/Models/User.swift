//
//  User.swift
//  InnerSight
//
//  Created by Kadir on 28.07.2023.
//

import Foundation
import RealmSwift

class User: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var username: String = ""
    @Persisted var dob: Date = Date()
}
