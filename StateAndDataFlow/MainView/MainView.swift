//
//  MainView.swift
//  StateAndDataFlow
//
//  Created by Paul Makey on 8.03.24.
//

import SwiftUI

struct MainView: View {
    @Environment(MainViewViewModel.self) var contentViewVM
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        VStack {
            Text("Hello, \(loginViewVM.user.name)!")
                .padding(.top, 100)
                .font(.largeTitle)
            
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
                        
            ButtonView(
                contentViewVM: contentViewVM,
                title: contentViewVM.buttonTitle,
                color: .red
            )
                .padding(.top, 50)
            
            Spacer()
            
            ButtonView(
                contentViewVM: contentViewVM,
                title: "Logout",
                color: .blue
            )
                .padding(.bottom, 50)
        }
    }
}

#Preview {
    MainView()
        .environmentObject(LoginViewViewModel())
        .environment(MainViewViewModel())
}

struct ButtonView: View {
   var contentViewVM: MainViewViewModel
    
    let title: String
    let color: Color
    
    var body: some View {
        Button(action: contentViewVM.startTimer) {
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
