//
//  SignUpViewModel.swift
//  InnerSight
//
//  Created by Kadir on 02.08.2023.
//


import Foundation


enum TimeOfDay {
    case morning, day, evening, night
}


class HomeViewModel: ObservableObject {
    private let um: UserManager
    
    init() {
        self.um = UserManager()
    }
    
    var username: String {
        let user = um.getUser()
        return user!.username
    }
    

    func getTimeOfDay() -> TimeOfDay {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: Date())

        switch hour {
        case 6..<12:
            return .morning
        case 12..<18:
            return .day
        case 18..<22:
            return .evening
        default:
            return .night
        }
    }
    
    
    func getGreetingTitle() -> String {
        var message: String
        
        switch self.getTimeOfDay() {
        case .morning:
            message = "Good morning"
        case .day:
            message = "Good day"
        case .evening:
            message = "Good evening"
        case .night:
            message = "Good night"
        }
        
        return "\(message), \(self.username)!"
    }
}
