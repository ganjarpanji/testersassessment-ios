//
//  LandingScreenSnapshotTests.swift
//  ReferenceiOSTests
//
//  Created by Ganjar Manggala on 08/06/2026.
//  Copyright © 2026 ABN AMRO. All rights reserved.
//

import XCTest
import SnapshotTesting
import UIKit
@testable import ReferenceiOS

/// Visual regression tests for the Landing Screen.
///
/// Validates UI rendering across various locales, device sizes, and system themes(light/dark).
/// Ensures that dynamic text, font hierarchy, and currency formatting
class LandingScreenSnapshotTests: XCTestCase {
    var viewController: ViewController!
        
    override func setUp() {
        super.setUp()
        viewController = initView()
    }
    
    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
    
    func testLandingScreen_WithMinimumAmount_ShouldRenderCorrectly() {
        // Verifying that a small amount renders correctly
        viewController.configureForSnapshotTest(with: TestConstants.Amount.min)
        verifySnapshot(viewController, testName: TestConstants.SnapshotName.min, on: [.iPhone13Pro])
    }
    
    func testLandingScreen_WithMaximumAmount_ShouldNotTruncate() {
        // Verifiying maximum amount will not truncated in very small screen device
        viewController.configureForSnapshotTest(with: TestConstants.Amount.maxLowerBound)
        verifySnapshot(viewController, testName: TestConstants.SnapshotName.maxNotTruncate, on: [.iPhoneSE])
    }
    
    func testLandingScreen_WithMaximumAmount_ShouldMaintainLayoutBalance() {
        // Ensure layout is properly displayed with long numbers on large screen device
        viewController.configureForSnapshotTest(with: TestConstants.Amount.maxUpperBound)
        verifySnapshot(viewController, testName: TestConstants.SnapshotName.layoutLarge, on: [.iPhone13ProMax])
    }
    
    func testLandingScreen_WithDecimalRoundUpAmount_ShouldNotTruncate() {
        // Ensure superscript numbers gets rendered properly
        viewController.configureForSnapshotTest(with: TestConstants.Amount.rounding)
        verifySnapshot(viewController, testName: TestConstants.SnapshotName.decimalRounding, on: [.iPhone13Pro])
    }
    
    func testLandingScreen_WithNormalAmountInDarkMode_ShouldMatchThemeDesign() {
        // Verifying that UI colors adapt correctly to Dark Mode
        viewController.configureForSnapshotTest(with: TestConstants.Amount.normal)
        verifySnapshot(viewController, testName: TestConstants.SnapshotName.darkMode, on: [.iPhone13Pro], isDarkMode: true)
    }
}
