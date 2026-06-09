//
//  ReferenceiOSUITests.swift
//  ReferenceiOSUITests
//
//  Created by Dunya Kirkali on 27/03/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import XCTest

/// UI Test for main screen of the apps (Landing Screen).
/// Includes user interaction, changing background state, and device rotation.
/// a11y check added as part of design guidelines validation.
final class ReferenceiOSUITests: BaseTestCase {

    private let tapCount = 10

    override func tearDown() {
        // Reset shared device state to avoid cross-test interference.
        XCUIDevice.shared.rotateToPortrait()
        super.tearDown()
    }

    // MARK: - Core User Flows

    func testUIElements_OnFirstLaunch_ShouldBeVisibleAndHittable() {
        landingScreen
            .assertGenerateButtonIsDisplayed()
            .assertGenerateButtonIsHittable()
            .assertHelloLabelIsDisplayed()
    }

    func testGenerateButton_WhenTapped_ShouldUpdateToRandomEuroAmount() {

        // Arrange & Act
        landingScreen
            .tapGenerateButton()
            .assertHelloTextNotDisplayed()
            .assertAmountHasEuroCurrency()

        // Capture state to verify the generated value actually changes.
        let previousAmount = landingScreen.getCurrentAmount()

        // Assert
        landingScreen
            .tapGenerateButton()
            .assertAmountHasEuroCurrency()
            .assertAmountIsUpdated(prevAmount: previousAmount)
    }

    func testGenerateButton_WhenTappedRepeatedly_ShouldNotCrashAndKeepUpdating() {

        // Simulate repeated user interaction.
        for _ in 1...tapCount {
            landingScreen.tapGenerateButton()
        }

        landingScreen
            .assertAmountHasEuroCurrency()
    }

    func testGenerateButton_WhenTapped_TitleShouldRemainUnchanged() {

        landingScreen
            .assertGenerateButtonHasTitle(TextConstants.generateButton)

        landingScreen
            .tapGenerateButton()
            .assertGenerateButtonHasTitle(TextConstants.generateButton)
    }

    // MARK: - Application Lifecycle & System Behaviour

    func testAppState_WhenRunInBackground_AmountShouldRemainUnchanged() {

        // Arrange
        landingScreen
            .tapGenerateButton()
            .assertAmountHasEuroCurrency()

        // Capture UI state before backgrounding.
        let expectedAmount = landingScreen.getCurrentAmount()

        // Act
        sendAppToBackground(seconds: 2.0)

        // Assert
        landingScreen
            .assertAmountHasEuroCurrency()
            .assertHelloTextNotDisplayed()
            .assertAmountRemains(expectedAmount: expectedAmount)
    }

    func testLayoutBehavior_WhenDeviceIsRotated_ShouldRemainUsable() {

        // Validate the main user flow remains functional after orientation changes.
        XCUIDevice.shared.rotateToLandscape()

        landingScreen
            .assertGenerateButtonIsHittable()
            .tapGenerateButton()
            .assertAmountHasEuroCurrency()
    }

    func testAmountFormat_InDifferentRegion_ShouldRemainInEuroCurrency() {

        // Verify formatting is independent from the device locale.
        launchApplication(withLocale: TestLocale.usEnglish)

        landingScreen
            .tapGenerateButton()
            .assertAmountHasEuroCurrency()
    }

    func testAmountLabel_AfterAppRelaunch_ShouldResetToHello() {

        // Arrange a non-default state.
        landingScreen
            .tapGenerateButton()
            .assertAmountHasEuroCurrency()

        // Verify a fresh app launch restores the initial UI state.
        relaunchApp()

        landingScreen
            .assertHelloLabelIsDisplayed()
            .assertGenerateButtonIsDisplayed()
    }

    // MARK: - Accessibility

    func testAccessibilityEntireScreen() throws {

        // Validate the screen against native accessibility audit.
        try runAccessibilityCheck()
    }
}
