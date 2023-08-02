//
//  SignUpViewModel.swift
//  InnerSight
//
//  Created by Kadir on 02.08.2023.
//


import Foundation


class SignupViewModel: ObservableObject {
        @Published var username: String = ""
        @Published var dob: String = ""
        @Published var goals: Array<String> = []

    
    // MARK: - Validation Functions
    
    func isNameValid() -> Bool {
        return !username.isEmpty
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
//    func signUp() {
//        // perform signup functions then clear fields
//        email = ""
//        password = ""
//        confirmPw = ""
//        birthYear = Calendar.current.dateComponents([.year], from: Date()).year!
//    }
}
