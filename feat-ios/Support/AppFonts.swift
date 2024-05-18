//
//  AppFonts.swift
//  feat-ios
//
//  Created by Soheil Novinfard on 18/05/2024.
//

import SwiftUI

// Enum to define different font styles
enum AppFontStyle: String {
    case bold = "Manrope-Bold"
    case extraBold = "Manrope-ExtraBold"
    case extraLight = "Manrope-ExtraLight"
    case light = "Manrope-Light"
    case medium = "Manrope-Medium"
    case regular = "Manrope-Regular"
    case semiBold = "Manrope-SemiBold"

    // Computed property to get the font name
    var fontName: String {
        return self.rawValue
    }
}

// Struct to manage fonts
struct AppFonts {
    // Method to get the Font object for a given style and size
    static func font(style: AppFontStyle, size: CGFloat) -> Font {
        return Font.custom(style.fontName, size: size)
    }
}
