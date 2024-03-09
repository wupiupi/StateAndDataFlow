//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Paul Makey on 8.03.24.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    @State private var contentViewVM = MainViewViewModel()
    @StateObject private var loginViewVM = LoginViewViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .environment(contentViewVM)
        .environmentObject(loginViewVM)
    }
}
