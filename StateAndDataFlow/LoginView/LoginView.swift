//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Paul Makey on 8.03.24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel

    var body: some View {
        VStack(spacing: 26) {
            
            HStack(spacing: 10) {
                TextField("Enter your name:", text: $loginViewVM.text)
                    .multilineTextAlignment(.leading)
                .textFieldStyle(.roundedBorder)
                .frame(width: 275)
                .border(loginViewVM.validationColor)
                
                Text(loginViewVM.counter.formatted())
                    .frame(width: 25, alignment: .trailing)
                    .onChange(of: loginViewVM.text) { _, _ in
                        loginViewVM.validateText()
                    }
                    .foregroundStyle(loginViewVM.validationColor)
            }
            
            Button(action: loginViewVM.login) {
                Label("Enter", systemImage: "checkmark.circle")
            }
            .disabled(!loginViewVM.shouldBeEnabled)
            
            Spacer()
        }
        .padding(.top, 250)
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
