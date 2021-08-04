//
//  HapticManager.swift
//  Crypto
//
//  Created by Maxim Granchenko on 04.08.2021.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
    
}
