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
        
    init() {
        // Initialize Realm instance in the constructor
        do {
            realm = try Realm()
        } catch {
            fatalError("Failed to initialize Realm: \(error)")
        }
    }
    
    func saveUser(username: String, age: Int, goals: Array<Goal>) {
        do {
            try realm.write {
                
                var goalArray: [GoalM] = []
                
                for goal in goals {
                    var g = GoalM()
                    g.icon = goal.icon
                    g.name = goal.name
                    g.desc = goal.description
                    g.selected = goal.selected
                    goalArray.append(g)
                }
                
                let user = User()
                user.username = username
                user.age = age
                user.goals.append(objectsIn: goalArray)
                
                realm.add(user)
                
                print("cretae a used inside a manager")
            }
        } catch {
            print("Error adding person: \(error)")
        }
    }
    
    func getUser() -> User? {
        do {
            let user = realm.objects(User.self).first
            return user
        }
    }
    
    func updateUser(user: User, username: String = "", age: Int = -1, goals: Array<Goal> = []) {
        do {
            try realm.write {
                if !username.isEmpty {
                    user.username = username
                }
                if age != -1 {
                    user.age = age
                }
                
                if let newGoals = goals as? [GoalM] {
                    var goalArray: [GoalM] = []
                    
                    for goal in goals {
                        var g = GoalM()
                        g.icon = goal.icon
                        g.name = goal.name
                        g.desc = goal.description
                        g.selected = goal.selected
                        goalArray.append(g)
                    }
                    
                    user.goals.removeAll()
                    user.goals.append(objectsIn: goalArray)
                }
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
    
    func wipeCollection() {
        do {
            let userCollection = realm.objects(User.self)
            
            try realm.write {
                realm.delete(userCollection)
            }
        } catch {
            print("Error deleting user collection: \(error)")
        }
    }
}

