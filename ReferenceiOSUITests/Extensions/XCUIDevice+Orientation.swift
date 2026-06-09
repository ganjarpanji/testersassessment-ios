//
//  XCUIDevice+Orientation.swift
//  ReferenceiOSUITests
//
//  Created by Ganjar Manggala on 09/06/2026.
//  Copyright © 2026 ABN AMRO. All rights reserved.
//

import Foundation
import XCTest

extension XCUIDevice {
    func rotateToLandscape() {
        self.orientation = .landscapeLeft
    }
    
    func rotateToPortrait() {
        self.orientation = .portrait
    }
}
