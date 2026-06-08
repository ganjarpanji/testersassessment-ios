//
//  XCTestCase+Snapshot.swift
//  ReferenceiOSTests
//
//  Created by Ganjar Manggala on 08/06/2026.
//  Copyright © 2026 ABN AMRO. All rights reserved.
//

import Foundation
import XCTest
import SnapshotTesting
@testable import ReferenceiOS

extension XCTestCase {
    internal func verifySnapshot(
        _ viewController: UIViewController,
        testName: String,
        on devices: [Simulator] = Simulator.allCases,
        isDarkMode: Bool = false
    ) {
        viewController.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
        
        // Suffix for file name
        let modeSuffix = isDarkMode ? "_Dark" : ""
        
        devices.forEach { simulator in
            assertSnapshot(
                matching: viewController,
                as: .image(on: simulator.config, traits: isDarkMode ? UITraitCollection(userInterfaceStyle: .dark) : .init()),
                testName: "\(testName)\(modeSuffix)_\(simulator.rawValue)"
            )
        }
    }
    
    internal func initView() -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.loadViewIfNeeded()
        return viewController
    }
}
