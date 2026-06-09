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
        isDarkMode: Bool = false,
        file: StaticString = #file // Ini adalah "magic" Swift
    ) {
        viewController.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
        
        // Suffix for file name
        let modeSuffix = isDarkMode ? "_Dark" : ""
        
        devices.forEach { simulator in
            assertSnapshot(
                of: viewController,
                as: .image(on: simulator.config, traits: isDarkMode ? UITraitCollection(userInterfaceStyle: .dark) : .init()),
                file: file, testName: "\(testName)\(modeSuffix)_\(simulator.rawValue)"
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
