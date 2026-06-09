//
//  BaseScreen.swift
//  ReferenceiOSUITests
//
//  Created by Ganjar Manggala on 04/06/2026.
//  Copyright © 2026 ABN AMRO. All rights reserved.
//

import Foundation
import XCTest

class BaseScreen {
    
    let app: XCUIApplication
        
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // MARK: - Element Assertion
    @discardableResult
    func assertElementIsDisplayed(element: XCUIElement) -> Self {
        expect(
            element: element,
            status: .exist
        )
        
        return self
    }
    
    @discardableResult
    func assertElementIsHittable(element: XCUIElement) -> Self {
        expect(
            element: element,
            status: .hittable,
            message: "Validation failed: Element '\(element)' is not hittable"
        )
        
        return self
    }
    
    // MARK: - Label Assertion
    @discardableResult
    func assertLabelHasText(element: XCUIElement, text: String) -> Self {
        expect(
            element: element,
            status: .exist
        )
        
        XCTAssertEqual(
            element.label,
            text,
            "Validation failed: Expected element label '\(element.label)' does not equal to '\(text)'"
        )
        
        return self
    }
    
    @discardableResult
    func assertLabelHasNoText(element: XCUIElement, text: String) -> Self {
        expect(
            element: element,
            status: .exist
        )
        
        XCTAssertNotEqual(
            element.label,
            text,
            "Validation failed: Expected element label '\(element.label)' equal to '\(text)'"
        )
        
        return self
    }
    
    @discardableResult
    func assertLabelDoesNotContainText(element: XCUIElement, text: String) -> Self {
        expect(
            element: element,
            status: .exist
        )

        XCTAssertFalse(
            element.label.contains(text),
            "Validation failed: Expected element label '\(element.label)' contains '\(text)'"
        )

        return self
    }
    
    @discardableResult
    func assertLabelContainsText(element: XCUIElement, text: String) -> Self {
        expect(
            element: element,
            status: .exist
        )
        XCTAssertTrue(
            element.label.contains(text),
            "Validation failed: Expected element label '\(element.label)' does not contain '\(text)'"
        )
        
        return self
    }
    
    // MARK: - Waiting
    @discardableResult
    func expect(element: XCUIElement, status: UIStatus = .exist, timeout: TimeInterval = TestTimeouts.defaultTimeout, message: String? = nil) -> XCUIElement {
        let elementExpectation = XCTNSPredicateExpectation(
            predicate: NSPredicate(format: status.rawValue),
            object: element
        )
        
        let result = XCTWaiter.wait(
            for: [elementExpectation],
            timeout: timeout
        )
        
        if result == .timedOut {
            let defaultMessage = "Validation failed: Element '\(element)' does not match status '\(status.rawValue)'"
            XCTFail(message ?? defaultMessage)
        }
        
        return element
    }
    
}
