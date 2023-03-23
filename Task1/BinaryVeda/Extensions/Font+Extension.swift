//
//  Font+Extension.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 23/03/23.
//

import SwiftUI
import UIKit

public enum Typography {
    case heading
    case label
    case info
    case title
    case largeTitle
    
    var size: CGFloat {
        switch self {
        case .heading:
            return 18
        case .label:
            return 14
        case .info:
            return 14
        case .title:
            return 24
        case .largeTitle:
            return 36
        }
    }
    
    var appFont: AppFont {
        switch self {
        case .heading:
            return .barlowMedium
        case .label:
            return .barlowCondensedLight
        case .info:
            return .barlowExtraLight
        case .title:
            return .barlowCondesnsedMedium
        case .largeTitle:
            return .barlowExtraLight
        }
    }
    
    var height: CGFloat {
        switch self {
        case .heading:
            return 24
        case .label:
            return 24
        case .info:
            return 29
        case .title:
            return 42
        case .largeTitle:
            return 28
        }
    }
}

public enum AppFont: String {
    case barlowMedium = "Barlow-Medium"
    case barlowExtraLight = "Barlow-ExtraLight"
    case barlowCondesnsedMedium = "BarlowCondensed-Medium"
    case barlowCondensedLight = "BarlowCondensed-Light"
}

public extension Font {
    static func font(with name: AppFont, size: CGFloat) -> Font {
        let customFont = Font.custom(name.rawValue, size: size)
        return customFont
    }
    
    static func font(for typography: Typography) -> Font {
        font(with: typography.appFont, size: typography.size)
    }
}

public extension Text {
    
    @ViewBuilder func typography(_ type: Typography) -> some View {
        let lineHeight = type.height
        
        self
            .font(.font(for: type))
            .frame(height: lineHeight)
    }
}
