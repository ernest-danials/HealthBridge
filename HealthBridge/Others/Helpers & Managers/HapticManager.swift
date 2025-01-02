//
//  HapticManager.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 12/7/24.
//

import UIKit

final class HapticManager {
    static let shared = HapticManager()
    
    init() {}
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        UINotificationFeedbackGenerator().notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        UIImpactFeedbackGenerator(style: style).impactOccurred()
    }
}
