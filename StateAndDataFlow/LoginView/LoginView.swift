//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Paul Makey on 8.03.24.
//

import SwiftUI

struct LoginView: View {
    @State private var text = ""
    var body: some View {
        VStack(spacing: 26) {
            
            HStack(spacing: 20) {
                TextField("Enter your name:", text: $text)
                    .multilineTextAlignment(.leading)
                .textFieldStyle(.roundedBorder)
                .frame(width: 300)
                
                Text("0")
            }
            
            Button(action: {}) {
                Label("Enter", systemImage: "checkmark.circle")
            }
            
            Spacer()
        }
        .padding(.top, 250)
    }
}

#Preview {
    LoginView()
}
