//
//  ReferenceiOSUITests.swift
//  ReferenceiOSUITests
//
//  Created by Dunya Kirkali on 27/03/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import XCTest

class ReferenceiOSUITests: XCTestCase {

    private let app = XCUIApplication()
    private lazy var landingScreen = LandingScreen(app: app)
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
  
    /// Verifies the initial state of the app after the app launches.
    /// The 'Hello' text and Generate button must be visible.
    func testLandingScreen_WhenAppLaunches_ShouldDisplayHelloAndButton() {
        landingScreen.assertHelloTextIsDisplayed()
        landingScreen.assertButtonIsDisplayed()
    }
    
    /// Verifies euro formatted amount is displayed after user taps Generate button.
    /// The initial 'Hello' text should be replaced by the new amount.
    func testGenerateButton_WhenTapped_ShouldDisplayFormattedEuroAmount() {
        // Act
        landingScreen.tapGenerateButton()
        
        // Assert
        landingScreen.assertHelloTextIsNotDisplayed()
        landingScreen.assertEuroFormattedAmountIsDisplayed()
    }
    
    /// Verifies that tapping Generate button again refreshes the existing amount.
    func testGenerateButton_WhenTappedAgain_ShouldRefreshAmount() {
        // Act
        landingScreen.tapGenerateButton()
        landingScreen.assertEuroFormattedAmountIsDisplayed()
        let firstAmount = landingScreen.currentAmount
        
        landingScreen.tapGenerateButton()
        
        // Assert
        landingScreen.assertEuroFormattedAmountIsDisplayed()
        XCTAssertNotEqual(
            firstAmount,
            landingScreen.currentAmount,
            "A second Generate tap should refresh the displayed amount!"
        )
        
    }
}
