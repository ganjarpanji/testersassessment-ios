//
//  LandingScreen.swift
//  ReferenceiOSUITests
//
//  Created by Ganjar Manggala on 04/06/2026.
//  Copyright © 2026 ABN AMRO. All rights reserved.
//

import Foundation
import XCTest

final class LandingScreen: BaseScreen {
    
    // MARK: - Elements
    private lazy var amountLabel = app
        .staticTexts
        .matching(identifier: Identifiers.amountLabel)
        .element
    
    private lazy var generateButton = app
        .buttons
        .matching(identifier: Identifiers.generateButton)
        .element
    
    // MARK: - Assertion
    @discardableResult
    func assertHelloLabelIsDisplayed() -> Self {
        assertLabelHasText(
            element: amountLabel,
            text: TextConstants.hello
        )
        
        return self
    }
    
    @discardableResult
    func assertAmountLabelIsDisplayed() -> Self {
        assertElementIsDisplayed(
            element: amountLabel
        )
        
        return self
    }
    
    @discardableResult
    func assertGenerateButtonIsDisplayed() -> Self {
        assertElementIsDisplayed(
            element: generateButton
        )
        
        return self
    }
    
    @discardableResult
    func assertGenerateButtonIsHittable() -> Self {
        assertElementIsHittable(
            element: generateButton
        )
        
        return self
    }
    
    @discardableResult
    func assertAmountHasEuroCurrency() -> Self {
        assertLabelContainsText(
            element: amountLabel,
            text: TextConstants.euroSymbol
        )
        
        return self
    }
    
    @discardableResult
    func assertHelloTextNotDisplayed() -> Self {
        assertLabelDoesNotContainText(
            element: amountLabel,
            text: TextConstants.hello
        )
        
        return self
    }
    
    @discardableResult
    func assertAmountIsUpdated(prevAmount: String) -> Self {
        assertLabelHasNoText(
            element: amountLabel,
            text: prevAmount
        )
        
        return self
    }
    
    @discardableResult
    func assertAmountRemains(expectedAmount: String) -> Self {
        assertLabelHasText(
            element: amountLabel,
            text: expectedAmount
        )
        
        return self
    }
    
    @discardableResult
    func assertGenerateButtonHasTitle(_ title: String) -> Self {
        assertLabelHasText(
            element: generateButton,
            text: title
        )
        return self
    }
    
    @discardableResult
    func assertAmountLabelIsNotTruncated() -> Self {
        assertElementIsNotTruncated(element: amountLabel)
        return self
    }

    // MARK: - Actions
    @discardableResult
    func tapGenerateButton() -> Self {
        expect(
            element: generateButton,
            status: .hittable
        )
        generateButton.tap()
        
        return self
    }
    
    // MARK: - Helpers
    func getCurrentAmount() -> String {
        amountLabel.label
    }
}

extension LandingScreen {
    enum Identifiers {
        static let base = "landingScreen"
        static let amountLabel = "\(base).amountLabel"
        static let generateButton = "\(base).generateButton"
    }
}
