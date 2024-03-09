//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Paul Makey on 8.03.24.
//

import Foundation

final class LoginViewViewModel: ObservableObject {
    var user = User(name: "")
    @Published var isLoggedIn = false
}
