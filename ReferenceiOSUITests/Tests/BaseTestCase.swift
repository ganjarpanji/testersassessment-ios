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
        
        // Pause the execution to let the app stay in background
        Thread.sleep(forTimeInterval: seconds)
        
        // Bring the main application back to foreground
        app.activate()
    }
    
    func launchApplication(withRegion region: String) {
        app.terminate()
        app.launchArguments = [
            "-AppleLocale", region
        ]
        app.launch()
    }
    
    func relaunchApp() {
        app.terminate()
        app.launch()
    }
}
