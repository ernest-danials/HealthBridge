//
//  SearchView.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 12/30/24.
//

import SwiftUI

struct SearchView: View {
    let geo: GeometryProxy

    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(showsIndicators: false) {
                VStack {
                    Text("Search View")

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
        SearchView(geo: geo)
            .environmentObject(ViewModel())
    }
} 
