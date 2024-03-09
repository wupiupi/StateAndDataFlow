//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Paul Makey on 8.03.24.
//

import Foundation
import SwiftUI

final class LoginViewViewModel: ObservableObject {
    
    @Published var isLoggedIn = false
    @Published var text = ""
    @Published var shouldBeEnabled = false
    @Published var validationColor = Color.red
    
    var user = User(name: "")
    
    var counter: Int {
        text.count
    }
                    
    func validateText() {
        validationColor = text.count >= 3
        ? .green
        : .red
        
        shouldBeEnabled = text.count >= 3
    }
    
    func login() {
        user.name = text
        text = ""
        isLoggedIn.toggle()
    }
}
