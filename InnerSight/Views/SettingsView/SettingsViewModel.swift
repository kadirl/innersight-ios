//
//  SignUpViewModel.swift
//  InnerSight
//
//  Created by Kadir on 02.08.2023.
//


import Foundation
import SwiftUI


class SettingsViewModel: ObservableObject {
    private let um: UserManager = UserManager()
    private let user: User
    
    @Published var goals: Array<Goal> = []
    
    init() {
        self.user = um.getUser()!
        var userGoals = self.user.goals
        
        for goal in userGoals {
            self.goals.append(
                Goal(
                    icon: goal.icon,
                    name: goal.name,
                    description: goal.desc,
                    selected: goal.selected
                )
            )
        }
    }
    
    // MARK: - Validation Functions
    
    func areGoalsValid() -> Bool {
        return goals.contains(where: { $0.selected })
    }

    
    // MARK: - Validation Prompt Strings

    func save() {
        
        print("started to work with manager")

        um.updateUser(user: self.user, goals: self.goals)
        
        print("finished to work with manager")
    }
}

