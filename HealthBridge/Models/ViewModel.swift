//
//  ViewModel.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 12/7/24.
//

import SwiftUI

final class ViewModel: ObservableObject {
    // MARK: - AppTabView
    @Published var selectedTab: TabViewItem = .home
    
    func changeSelectedTab(to item: TabViewItem) {
        withAnimation(.spring) { self.selectedTab = item }
    }

    // MARK: - User
    @Published var userType: UserType = .patient

    func changeUserType(to type: UserType) {
        withAnimation(.spring(duration: 1.0)) { self.userType = type }
    }

    // MARK: - Theme
    func getThemeColor() -> Color {
        switch userType {
        case .doctor:
            return .blue
        case .patient:
            return .green
        default:
            return .gray
        }
    }

    // MARK: - Share Additional Medical Information
    @Published var currentAdditionalMedicalInformation: [String] = []
}
