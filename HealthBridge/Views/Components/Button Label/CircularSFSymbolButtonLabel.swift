//
//  CircularSFSymbolButtonLabel.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 12/30/24.
//

import SwiftUI

struct CircularSFSymbolButtonLabel: View {
    let imageName: String
    let size: CGFloat
    let fontWeight: Font.Weight
    let imagePadding: CGFloat
    let backgroundColor: Color
    let borderColor: Color
    let borderWidth: CGFloat
    
    init(imageName: String, size: CGFloat = 30, fontWeight: Font.Weight = .medium, imagePadding: CGFloat = 3, backgroundColor: Color = Color(uiColor: .systemGray6), borderColor: Color = Color(uiColor: .systemGray6).opacity(0.8), borderWidth: CGFloat = 1) {
        self.imageName = imageName
        self.size = size
        self.fontWeight = fontWeight
        self.imagePadding = imagePadding
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
    }

    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .scaledToFit()
            .fontWeight(fontWeight)
            .padding(imagePadding)
            .frame(width: size, height: size)
            .padding()
            .background(backgroundColor)
            .clipShape(.circle)
            .overlay {
                Circle()
                    .strokeBorder(borderColor, lineWidth: borderWidth)
            }
    }
}

#Preview {
    CircularSFSymbolButtonLabel(imageName: "xmark")
}
