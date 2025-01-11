//
//  TabBar.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 12/30/24.
//

import SwiftUI

struct TabBar: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            ProgressBlurView()
                .blur(radius: 10)
                .frame(height: 200)
                .padding(.horizontal, -15)
                .padding(.bottom, -100)
            
            switch viewModel.selectedTab {
            case .home:
                homeTabButtons()
                    .alignView(to: .center)
                    .padding()
                    .transition(.offset(y: 20).combined(with: .blurReplace))
            case .writeLetter:
                HStack {
                    Button {
                        HapticManager.shared.impact(style: .soft)
                    } label: {
                        CapsuleButtonLabel(imageName: "paperplane", text: "Send Letter")
                    }.scaleButtonStyle()
                    
                    Button {
                        self.viewModel.changeSelectedTab(to: .home)
                        HapticManager.shared.impact(style: .soft)
                    } label: {
                        CircularSFSymbolButtonLabel(imageName: "xmark")
                    }.scaleButtonStyle(scaleAmount: 0.97)
                }
                .alignView(to: .center)
                .padding()
                .transition(.offset(y: 20).combined(with: .blurReplace))
            case .search:
                HStack {
                    Button {
                        self.viewModel.changeSelectedTab(to: .home)
                        HapticManager.shared.impact(style: .soft)
                    } label: {
                        CircularSFSymbolButtonLabel(imageName: "xmark")
                    }.scaleButtonStyle(scaleAmount: 0.97)
                }
                .transition(.offset(y: 20).combined(with: .blurReplace))
            case .profile:
                HStack {
                    Button {
                        self.viewModel.changeSelectedTab(to: .home)
                        HapticManager.shared.impact(style: .soft)
                    } label: {
                        CircularSFSymbolButtonLabel(imageName: "xmark")
                    }.scaleButtonStyle(scaleAmount: 0.97)
                }
                .transition(.offset(y: 20).combined(with: .blurReplace))
            }
        }.frame(height: 80).alignViewVertically(to: .bottom)
    }
    
    @ViewBuilder private func homeTabButtons() -> some View {
        HStack {
            Button {
                viewModel.changeSelectedTab(to: .writeLetter)
                HapticManager.shared.impact(style: .soft)
            } label: {
                CapsuleButtonLabel(imageName: TabViewItem.writeLetter.getImageName(), text: TabViewItem.writeLetter.rawValue)
            }.scaleButtonStyle()
            
            ForEach(TabViewItem.allCases.dropFirst(2)) { item in
                Button {
                    viewModel.changeSelectedTab(to: item)
                    HapticManager.shared.impact(style: .soft)
                } label: {
                    CircularSFSymbolButtonLabel(imageName: item.getImageName(), imagePadding: item == .search ? 3 : 0)
                }.scaleButtonStyle(scaleAmount: 0.97)
            }
        }
    }
}

#Preview {
    AppTabView().environmentObject(ViewModel())
    //TabBar().environmentObject(ViewModel())
}
