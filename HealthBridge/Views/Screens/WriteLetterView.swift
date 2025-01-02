//
//  WriteLetterView.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 12/30/24.
//

import SwiftUI

struct WriteLetterView: View {
    let geo: GeometryProxy

    @EnvironmentObject var viewModel: ViewModel
        
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(showsIndicators: false) {
                VStack {
                    Text("Write Letter View")

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
        WriteLetterView(geo: geo)
            .environmentObject(ViewModel())
    }
}
