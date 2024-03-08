//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Paul Makey on 8.03.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, Paul!")
                .padding(.top, 100)
                .font(.largeTitle)
            
            Text("0")
                .font(.largeTitle)
                .padding(.top, 100)
                        
            ActionButton(title: "Start", color: .red)
                .padding(.top, 50)
            
            Spacer()
            
            ActionButton(title: "Logout", color: .blue)
                .padding(.bottom, 50)
        }
    }
}

#Preview {
    ContentView()
}

struct ActionButton: View {
    let title: String
    let color: Color
    
    var body: some View {
        Button(action: {}) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 150, height: 60)
        .background(color)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 4)
        )
    }
}
