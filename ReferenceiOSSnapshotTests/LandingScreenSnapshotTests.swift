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
        viewController.configureForSnapshotTest(with: TestConstants.Amount.min)
        verifySnapshot(viewController, testName: TestConstants.SnapshotName.min, on: [.iPhone13Pro])
    }
    
    func testLandingScreen_WithMaximumAmount_ShouldNotTruncate() {
        viewController.configureForSnapshotTest(with: TestConstants.Amount.maxLowerBound)
        verifySnapshot(viewController, testName: TestConstants.SnapshotName.maxNotTruncate, on: [.iPhoneSE])
    }
    
    func testLandingScreen_WithMaximumAmount_ShouldMaintainLayoutBalance() {
        viewController.configureForSnapshotTest(with: TestConstants.Amount.maxUpperBound)
        verifySnapshot(viewController, testName: TestConstants.SnapshotName.layoutLarge, on: [.iPhone13ProMax])
    }
    
    func testLandingScreen_WithDecimalRoundUpAmount_ShouldNotTruncate() {
        viewController.configureForSnapshotTest(with: TestConstants.Amount.rounding)
        verifySnapshot(viewController, testName: TestConstants.SnapshotName.decimalRounding, on: [.iPhone13Pro])
    }
    
    func testLandingScreen_WithNormalAmountInDarkMode_ShouldMatchThemeDesign() {
        viewController.configureForSnapshotTest(with: TestConstants.Amount.normal)
        verifySnapshot(viewController, testName: TestConstants.SnapshotName.darkMode, on: [.iPhone13Pro], isDarkMode: true)
    }
}
