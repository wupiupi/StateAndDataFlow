//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Paul Makey on 8.03.24.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    @State private var text = ""
    @State private var shouldBeDisabled = true
    
    private var symbolsCounter: Int {
        text.count
    }
    
    var body: some View {
        VStack(spacing: 26) {
            
            HStack(spacing: 20) {
                TextField("Enter your name:", text: $text)
                    .multilineTextAlignment(.leading)
                .textFieldStyle(.roundedBorder)
                .frame(width: 300)
                
                Text(symbolsCounter.formatted())
                    .onChange(of: text) { _, newValue in
                        shouldBeDisabled = newValue.count >= 3 
                        ? false
                        : true
                    }
            }
            
            Button(action: login) {
                Label("Enter", systemImage: "checkmark.circle")
            }
            .disabled(shouldBeDisabled)
            
            Spacer()
        }
        .padding(.top, 250)
    }
    
    private func login() {
        loginViewVM.user.name = text
        loginViewVM.isLoggedIn.toggle()
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
