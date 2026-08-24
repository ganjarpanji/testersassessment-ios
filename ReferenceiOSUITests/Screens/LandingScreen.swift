//
//  LandingScreen.swift
//  ReferenceiOSUITests
//
//  Created by Ganjar Manggala on 19/08/2026.
//  Copyright © 2026 ABN AMRO. All rights reserved.
//

import XCTest

class LandingScreen {
    
    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }
    
    // MARK: - Elements
    private lazy var mainLabel = app.staticTexts["label"]
    private lazy var generateButton = app.buttons["generateButton"]
    
    // MARK: - Actions
    func tapGenerateButton() {
        generateButton.tap()
    }
    
    // MARK: - Assertions
    func assertHelloTextIsDisplayed() {
        XCTAssertTrue(
            mainLabel.waitForExistence(timeout: 10),
            "Hello text does not exist"
        )
        XCTAssertEqual(mainLabel.label, "Hello", "Label should display Hello!")
    }
    
    func assertHelloTextIsNotDisplayed() {
        XCTAssertNotEqual(mainLabel.label, "Hello", "Label should no longer display Hello!")
    }
   
    func assertEuroFormattedAmountIsDisplayed() {
        XCTAssertTrue(mainLabel.label.contains("€"), "Generated amount does not contain € symbol")
    }

    func assertButtonIsDisplayed() {
        XCTAssertTrue(
            generateButton.waitForExistence(timeout: 10),
            "Generate button does not exist"
        )
        XCTAssertTrue(generateButton.isHittable, "Generate button is not hittable")
    }
    
    // MARK: - Helpers
    var currentAmount: String {
        mainLabel.label
    }
}

