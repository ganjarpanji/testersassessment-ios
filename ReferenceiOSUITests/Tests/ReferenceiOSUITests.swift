//
//  ReferenceiOSUITests.swift
//  ReferenceiOSUITests
//
//  Created by Dunya Kirkali on 27/03/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import XCTest

class ReferenceiOSUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    private let landingScreen = LandingScreen()
    
    ///Verifies the initial state of the app after the app launches
    ///the 'Hello' text and Generate button must be visible
    func testLandingScreen_WhenAppLaunch_ShouldDisplayHelloAndButton() {
        landingScreen.assertHelloTextIsDisplayed()
        landingScreen.assertButtonIsDisplayed()
    }
}
