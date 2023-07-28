//
//  RealmManager.swift
//  InnerSight
//
//  Created by Kadir on 28.07.2023.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    
    init() {
        openRealm()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
        }   catch {
            print("Error opening Realm: \(error)")
        }
    }
    
    // User handler
    func addUser(username: String, dob: Date) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newUser = User(value: ["username": username, "dob": dob])
                    localRealm.add(newUser)
                    print("Added new user to Realm: \(newUser)")
                }
            } catch {
                print("Error adding new user to Realm: \(error)")
            }
        }
    }
    
//    // Chats handler
//    func createChat(goals: Dictionary) {
//
//    }
}
