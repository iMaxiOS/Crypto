//
//  Color.swift
//  Crypto
//
//  Created by Maxim Granchenko on 10.06.2021.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let launchAccent = Color("LaunchAccentColor")
    let launchBackground = Color("LaunchBackgroundColor")
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}
