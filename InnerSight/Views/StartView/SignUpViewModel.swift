//
//  SignUpViewModel.swift
//  InnerSight
//
//  Created by Kadir on 02.08.2023.
//


import Foundation


class Goal: ObservableObject {
    public var icon: String
    public var name: String
    public var description: String
    @Published var selected: Bool = false
    
    init(icon: String, name: String, description: String, selected: Bool = false) {
        self.icon = icon
        self.name = name
        self.description = description
        self.selected = selected
    }
}

var goalsList = [
    Goal(
        icon: "face.smiling",
        name: "Boost Positivity",
        description: "Cultivate gratitude, stay positive."
    ),
    Goal(
        icon: "bolt.fill",
        name: "Manage Stress",
        description: "Reduce stress effectively."
    ),
    Goal(
        icon: "moon.zzz.fill",
        name: "Improve Sleep",
        description: "Enhance sleep habits."
    ),
    Goal(
        icon: "figure.run",
        name: "Stay Active",
        description: "Exercise for mood."
    ),
    Goal(
        icon: "figure.mind.and.body",
        name: "Practice Mindfulness",
        description: "Reduce anxiety, be present."
    ),
    Goal(
        icon: "point.3.filled.connected.trianglepath.dotted",
        name: "Strengthen Connections",
        description: "Nurture relationships."
    ),
    Goal(
        icon: "trophy.fill",
        name: "Build Confidence",
        description: "Improve self-esteem."
    ),
    Goal(
        icon: "burst.fill",
        name: "Handle Emotions",
        description: "Manage anger constructively."
    ),
    Goal(
        icon: "bolt.heart.fill",
        name: "Develop Coping Skills",
        description: "Build resilience."
    ),
    Goal(
        icon: "water.waves",
        name: "Enhance Emotional Awareness",
        description: "Understand emotions."
    ),
    Goal(
        icon: "circle.and.line.horizontal.fill",
        name: "Find Balance",
        description: "Prioritize well-being."
    ),
    Goal(
        icon: "camera.macro",
        name: "Prioritize Self-Care",
        description: "Nurture yourself."
    ),
    Goal(
        icon: "shield.righthalf.filled",
        name: "Build Resilience",
        description: "Bounce back stronger."
    ),
    Goal(
        icon: "speaker.wave.2.fill",
        name: "Express Emotions",
        description: "Communicate feelings."
    ),
    Goal(
        icon: "arrow.triangle.turn.up.right.diamond.fill",
        name: "Find Purpose",
        description: "Seek fulfillment."
    ),

]


class SignupViewModel: ObservableObject {
        @Published var username: String = ""
        @Published var age: Int = 13
        @Published var goals: Array<Goal> = goalsList

    
    // MARK: - Validation Functions
    
    func isUsernameEntered() -> Bool {
        return !username.isEmpty
    }
    
    func isUsernameLengthValid() -> Bool {
        return username.count <= 64
    }
    
    func isAgeValid() -> Bool {
        return true
    }
    
    func areGoalsValid() -> Bool {
        return goals.contains(where: { $0.selected })
    }

    
    // MARK: - Validation Prompt Strings
    
//    var agePrompt: String {
//        if isValidAge() {
//            return "Year of birth"
//        } else {
//            return "Year of birth (must be 21 years old)"
//        }
//    }
//    
    func signUp() {
        UserDefaults.standard.set(true, forKey: "hasSignedUp")
        
        print("started to work with manager")
        
        let um = UserManager()
        um.wipeCollection()
        um.saveUser(username: username, age: age, goals: goals)
        
        print("finished to work with manager")
        
        username = ""
        age = 13
        goals = goalsList
    }
}
