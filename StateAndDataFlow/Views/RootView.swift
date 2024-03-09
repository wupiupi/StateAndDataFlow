//
//  RootView.swift
//  StateAndDataFlow
//
//  Created by Paul Makey on 8.03.24.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        if loginViewVM.isLoggedIn {
            ContentView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    RootView()
        .environmentObject(LoginViewViewModel())
}
