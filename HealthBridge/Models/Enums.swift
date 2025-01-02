//
//  Enums.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 12/7/24.
//

import SwiftUI

enum TabViewItem: String, Identifiable, CaseIterable {
    case home = "Home"
    case writeLetter = "Write a Letter"
    case search = "Search"
    case profile = "Profile"

    var id: Self { self }
    
    func getImageName() -> String {
        switch self {
        case .home:
            return "tray.full"
        case .search:
            return "magnifyingglass"
        case .profile:
            return "person.crop.circle"
        case .writeLetter:
            return "pencil.and.scribble"
        }
    }
}

enum Gender: String, Identifiable, Codable, CaseIterable {
    case male = "Male"
    case female = "Female"

    var id: Self { self }
}

enum UserType: String, Identifiable, CaseIterable {
    case patient = "Patient"
    case doctor = "Doctor"
    case none = "None"
    var id: Self { self }

    func getImageName() -> String {
        switch self {
        case .patient:
            return "person.fill"
        case .doctor:
            return "stethoscope"
        case .none:
            return "questionmark.circle"
        }
    }

    func getThemeColor() -> Color {
        switch self {
        case .patient:
            return .green
        case .doctor:
            return .blue
        case .none:
            return .gray
        }
    }
}
