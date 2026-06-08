//
//  BaseTestCase.swift
//  ReferenceiOSUITests
//
//  Created by Ganjar Manggala on 04/06/2026.
//  Copyright © 2026 ABN AMRO. All rights reserved.
//

import Foundation
import XCTest

class BaseTestCase: XCTestCase {
    let app = XCUIApplication()
    private(set) lazy var landingScreen = LandingScreen(app: app)
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    func sendAppToBackground(seconds: TimeInterval = 2.0) {
        let settingsApp = XCUIApplication(bundleIdentifier: SystemApps.settingsApp)
        settingsApp.launch()
        
        let expectation = XCTestExpectation(description: "Settings app in foreground")
            _ = XCTWaiter.wait(for: [expectation], timeout: seconds)

        app.activate()
        
        let appRunning = NSPredicate(format: "state == %d", XCUIApplication.State.runningForeground.rawValue)
        let appExpectation = XCTNSPredicateExpectation(predicate: appRunning, object: app)
        _ = XCTWaiter.wait(for: [appExpectation], timeout: TestTimeouts.defaultTimeout)
    }
    
    func launchApplication(withLocale locale: TestLocale) {
        app.terminate()
        app.launchArguments += [
            "-AppleLocale", locale.regionCode,
            "-AppleLanguages", "(\(locale.languageCode))"
        ]
        app.launch()
    }
    
    func relaunchApp() {
        app.terminate()
        app.launch()
    }
    
    func relaunchApp(mockAmount: String) {
        app.launchEnvironment["MOCK_AMOUNT"] = mockAmount
        relaunchApp()
    }
    
    func runAccessibilityCheck() throws {
        if #available(iOS 17.0, *) {
            try? app.performAccessibilityAudit(for: [.elementDetection, .dynamicType])
        } else {
            throw XCTSkip(
                "Skipping accessibility test as it requires iOS 17.0 or later."
            )
        }
    }
}
