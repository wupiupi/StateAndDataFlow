//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Paul Makey on 8.03.24.
//

import Foundation

// Есть подозрения, что это фатальная ошибка, но иначе я не придумал 😞
import SwiftUI

final class LoginViewViewModel: ObservableObject {
    private let storageManager = StorageManager.shared
    
    @Published var isLoggedIn = false
    @Published var text = ""
    @Published var shouldBeEnabled = false
    @Published var validationColor = Color.red
    
    var user = User(name: "", isLoggedIn: false)
    
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
        user = storageManager.fetch()
        user.name = text
        user.isLoggedIn = isLoggedIn
        storageManager.create(user: user)
        text = ""
        isLoggedIn.toggle()
    }
}
