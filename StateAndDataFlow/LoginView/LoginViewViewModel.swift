//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Paul Makey on 8.03.24.
//

import Foundation
import SwiftUI

final class LoginViewViewModel: ObservableObject {
    private let storageManager = StorageManager.shared
    
    @Published var text = ""
    @Published var shouldBeEnabled = false
    @Published var validationColor = Color.red
        
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
        guard var user = storageManager.fetch() else { return }
        
        user.name = text
        user.isLoggedIn.toggle()
        
        storageManager.save(user: user)
        
        text = ""
    }
}
