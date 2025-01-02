//
//  ContentView.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 12/7/24.
//

import SwiftUI

struct AppTabView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                HomeView(geo: geo)
                    //.opacity(viewModel.selectedTab == .home ? 1 : 0)
                    .disabled(viewModel.selectedTab != .home)
                    .transition(.blurReplace)
                
                ProfileView(geo: geo)
                    .opacity(viewModel.selectedTab == .profile ? 1 : 0)
                    .disabled(viewModel.selectedTab != .profile)
                    .transition(.blurReplace)
                
                SearchView(geo: geo)
                    .opacity(viewModel.selectedTab == .search ? 1 : 0)
                    .disabled(viewModel.selectedTab != .search)
                    .transition(.blurReplace)
                
                WriteLetterView(geo: geo)
                    .opacity(viewModel.selectedTab == .writeLetter ? 1 : 0)
                    .disabled(viewModel.selectedTab != .writeLetter)
                    .transition(.blurReplace)
                
                TabBar()
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .accentColor(viewModel.getThemeColor())
        .tint(viewModel.getThemeColor())
    }
}

#Preview {
    AppTabView().environmentObject(ViewModel())
}
