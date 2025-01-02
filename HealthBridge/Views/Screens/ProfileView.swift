//
//  ProfileView.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 12/30/24.
//

import SwiftUI

struct ProfileView: View {
    let geo: GeometryProxy

    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(showsIndicators: false) {
                VStack {
                    Button {
                        viewModel.changeUserType(to: .none)
                        viewModel.changeSelectedTab(to: .home)
                        HapticManager.shared.impact(style: .soft)
                    } label: {
                        Text("Sign Out")
                            .customFont(size: 16, weight: .semibold)
                            .foregroundStyle(.red)
                    }.scaleButtonStyle()

                    Spacer().frame(height: 100)
                }
            }
        }
        .alignView(to: .center)
        .background(Material.ultraThin)
    }
}

#Preview {
    GeometryReader { geo in
        ProfileView(geo: geo)
            .environmentObject(ViewModel())
    }
} 