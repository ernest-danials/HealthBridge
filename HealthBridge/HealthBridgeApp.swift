//
//  HealthBridgeApp.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 12/7/24.
//

import SwiftUI

@main
struct HealthBridgeApp: App {
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                AppTabView()
                    .disabled(viewModel.userType == .none)

                if viewModel.userType == .none {
                    SignInView()
                }
            }.environmentObject(viewModel)
        }
    }
}
