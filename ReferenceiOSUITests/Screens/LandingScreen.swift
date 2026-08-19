//
//  LandingScreen.swift
//  ReferenceiOS
//
//  Created by Ganjar Manggala on 19/08/2026.
//  Copyright © 2026 ABN AMRO. All rights reserved.
//

import XCTest

class LandingScreen {
    
    let app = XCUIApplication()
    
    // MARK: - Elements
    private lazy var mainLabel = app.staticTexts["label"]
    private lazy var generateButton = app.buttons["generate_button"]
    
    // MARK: - Actions
    func tapGenerateButton() {
        generateButton.tap()
    }
    
    // MARK: - Assertions
    func assertHelloTextIsDisplayed() {
        XCTAssertTrue(mainLabel.exists, "Hello text is not exist")
        XCTAssertEqual(mainLabel.label, "Hello", "Label is not equal to Hello!")
    }

    func assertButtonIsDisplayed() {
        XCTAssertTrue(generateButton.exists, "Generate button is not exist")
        XCTAssertTrue(generateButton.isHittable, "Generate button is not hittable")
    }
}

