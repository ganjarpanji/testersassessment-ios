//
//  UITestConstants.swift
//  ReferenceiOSUITests
//
//  Created by Ganjar Manggala on 04/06/2026.
//  Copyright © 2026 ABN AMRO. All rights reserved.
//

import Foundation

enum UIStatus: String {
    case exist = "exists == true"
    case hittable = "isHittable == 1"
}

enum TestTimeouts {
    static let defaultTimeout: TimeInterval = 10.0
}

enum TextConstants {
    static let hello: String = "Hello"
    static let generateButton: String = "Button"
    static let euroSymbol:String = "€"
}

enum SystemApps {
    static let settingsApp: String = "com.apple.Preferences"
}

enum TestLocale {
    case usEnglish
    
    var regionCode: String {
        switch self {
        case .usEnglish:     return "en_US"
        }
    }
    
    var languageCode: String {
        switch self {
        case .usEnglish: return "en"
        }
    }
}
