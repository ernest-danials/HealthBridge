//
//  CapsuleButtonLabel.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 12/30/24.
//

import SwiftUI

struct CapsuleButtonLabel: View {
    let imageName: String?
    let text: String
    let fontSize: CGFloat
    let fontWeight: Font.Weight
    let height: CGFloat
    let foregroundColor: Color
    let backgroundColor: Color

    init(imageName: String? = nil, text: String, fontSize: CGFloat = 17, fontWeight: Font.Weight = .bold, height: CGFloat = 30, foregroundColor: Color = .white, backgroundColor: Color = .accentColor) {
        self.imageName = imageName
        self.text = text
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.height = height
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        HStack(spacing: 5) {
            if let imageName = imageName {
                Image(systemName: imageName)
                    .fontWeight(fontWeight)
            }
            
            Text(text)
                .customFont(size: fontSize, weight: fontWeight)
        }
        .foregroundStyle(foregroundColor)
        .alignView(to: .center)
        .frame(height: height)
        .padding()
        .background(backgroundColor)
        .clipShape(.capsule)
    }
}

#Preview {
    CapsuleButtonLabel(imageName: "xmark", text: "Preview")
}
