//
//  MainView.swift
//  StateAndDataFlow
//
//  Created by Paul Makey on 8.03.24.
//

import SwiftUI

struct MainView: View {
    @Environment(MainViewViewModel.self) var mainViewVM
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View { 
        VStack {
            Text("Hello, \(loginViewVM.user.name)!")
                .padding(.top, 100)
                .font(.largeTitle)
            
            Text(mainViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
                        
            ButtonView(
                mainViewVM: mainViewVM,
                title: mainViewVM.buttonTitle,
                color: .red,
                action: mainViewVM.startTimer
            )
                .padding(.top, 50)
            
            Spacer()
            
            ButtonView(
                mainViewVM: mainViewVM,
                title: "Logout",
                color: .blue,
                action: logout
            )
                .padding(.bottom, 50)
        }
    }
    
    private func logout() {
        loginViewVM.isLoggedIn.toggle()
    }
}

#Preview {
    MainView()
        .environmentObject(LoginViewViewModel())
        .environment(MainViewViewModel())
}

struct ButtonView: View {
   var mainViewVM: MainViewViewModel
    
    let title: String
    let color: Color
    let action: () -> ()
    
    var body: some View {
        Button(action: action) {
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
