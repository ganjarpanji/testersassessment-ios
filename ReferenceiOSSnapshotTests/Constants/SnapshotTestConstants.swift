//
//  SnapshotTestConstants.swift
//  ReferenceiOSTests
//
//  Created by Ganjar Manggala on 08/06/2026.
//  Copyright © 2026 ABN AMRO. All rights reserved.
//

import Foundation

enum TestConstants {
    enum Amount {
        static let min: Double = 100.00
        static let maxLowerBound: Double = 99999998.99
        static let maxUpperBound: Double = 99999999.99
        static let rounding: Double = 55555.555
        static let normal: Double = 555555.55
    }
    
    enum SnapshotName {
        static let min = "MinAmountShouldRenderCorrectly"
        static let maxNotTruncate = "TextShouldNotTruncateOnSmallDevice"
        static let layoutLarge = "LayoutShouldCorrectOnLargeDevice"
        static let decimalRounding = "DecimalRoundupShouldNotTruncate"
        static let darkMode = "ShouldMatchThemeDesignDarkMode"
    }
}
