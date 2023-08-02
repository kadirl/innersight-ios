//
//  UserManager.swift
//  InnerSight
//
//  Created by Kadir on 01.08.2023.
//

import Foundation
import RealmSwift


class UserManager {
    private let realm: Realm
    
    init(realm: Realm) {
        self.realm = realm
    }
    
    func addUser(username: String, dob: Date) {
        do {
            try realm.write {
                let user = User()
                user.username = username
                user.dob = dob
                realm.add(user)
            }
        } catch {
            print("Error adding person: \(error)")
        }
    }
    
    func doesUserExist(username: String) -> Bool {
        let existingUser = realm.objects(User.self).filter("username = %@", username).first
        return existingUser != nil
    }
    
    func updateUser(user: User, username: String, dob: Date) {
        do {
            try realm.write {
                user.username = username
                user.dob = dob
            }
        } catch {
            print("Error updating user: \(error)")
        }
    }
    
    func deleteUser(user: User) {
        do {
            try realm.write {
                realm.delete(user)
            }
        } catch {
            print("Error deleting user: \(error)")
        }
    }
}

