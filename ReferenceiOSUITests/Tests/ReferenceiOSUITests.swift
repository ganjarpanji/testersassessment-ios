//
//  ReferenceiOSUITests.swift
//  ReferenceiOSUITests
//
//  Created by Dunya Kirkali on 27/03/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import XCTest

class ReferenceiOSUITests: BaseTestCase {
    
    override func tearDown() {
        XCUIDevice.shared.orientation = .portrait
        super.tearDown()
    }
    
    // MARK: - Core Happy Path Tests
    func testUIElements_OnFirstLaunch_ShouldBeVisibleAndHittable() {
        landingScreen
            .assertGenerateButtonIsDisplayed()
            .assertGenerateButtonIsHittable()
            .assertHelloLabelIsDisplayed()
    }

    func testGenerateButton_WhenTapped_ShouldUpdateToRandomEuroAmount() {
        // First tap & verification
        landingScreen
            .tapGenerateButton()
            .assertHelloTextNotDisplayed()
            .assertAmountHasEuroCurrency()
        
        // Extract state for dynamic validation
        let previousAmount = landingScreen.getCurrentAmount()
        
        // Second tap & verification (ensuring the amount actually changes)
        landingScreen
            .tapGenerateButton()
            .assertAmountHasEuroCurrency()
            .assertAmountIsUpdated(prevAmount: previousAmount)
    }
    
    func testGenerateButton_WhenTappedRepeatedly_ShouldNotCrashAndKeepUpdating() {
        // Tap the button 5 times continuously
        for _ in 1...5 {
            landingScreen.tapGenerateButton()
        }
        
        // Verify the final state
        landingScreen
            .assertAmountHasEuroCurrency()
    }
    
    func testGenerateButton_WhenTapped_TitleShouldRemainUnchanged() {
        // Verify title before tapping
        landingScreen
            .assertGenerateButtonHasTitle(TextConstants.generateButton)

        // Tap and verify title is still unchanged
        landingScreen
            .tapGenerateButton()
            .assertGenerateButtonHasTitle(TextConstants.generateButton)
    }
    
    // MARK: - Device & System Integration Tests
    func testAppState_WhenRunInBackground_AmountShouldRemainUnchanged() {
        // Generate the initial random amount
        landingScreen
            .tapGenerateButton()
            .assertAmountHasEuroCurrency()
        
        // Extract the generated amount string to compare later
        let expectedAmountBeforeBackground = landingScreen.getCurrentAmount()
        
        // Send the application to the background
        sendAppToBackground(seconds: 2.0)
        
        // Verify the app recovers and preserves the exact same data
        landingScreen
            .assertAmountHasEuroCurrency()
            .assertHelloTextNotDisplayed()
            .assertAmountRemains(expectedAmount: expectedAmountBeforeBackground)
    }
    
    func testLayoutBehavior_WhenDeviceIsRotated_ShouldRemainFunctional() {
        let device = XCUIDevice.shared
        
        // Rotate to landscape
        device.orientation = .landscapeLeft
        
        // Generate amount
        landingScreen
            .assertGenerateButtonIsHittable()
            .tapGenerateButton()
            .assertAmountHasEuroCurrency()
    }
    
    func testAmountFormat_InDifferentRegion_ShouldRemainInEuroCurrency() {
        // Set locale to US
        launchApplication(withRegion: TestLocale.US)

        landingScreen
            .tapGenerateButton()
            .assertAmountHasEuroCurrency()
    }

    func testAmountLabel_AfterAppRelaunch_ShouldResetToHello() {
        // Generate an amount first
        landingScreen
            .tapGenerateButton()
            .assertAmountHasEuroCurrency()

        // Relaunch the app
        relaunchApp()

        // Verify the label resets back to "Hello"
        landingScreen
            .assertHelloLabelIsDisplayed()
            .assertGenerateButtonIsDisplayed()
    }

}
