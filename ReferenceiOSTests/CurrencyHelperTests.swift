//
//  CurrencyHelperTests.swift
//  ReferenceiOSTests
//
//  Created by Dunya Kirkali on 27/03/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import XCTest
@testable import ReferenceiOS

class CurrencyHelperTests: XCTestCase {
    func testFormat_WhenAmountHasThreeDecimalPlaces_ShouldRoundToTwoDecimalPlaces() {
        let number: NSNumber = 129.999
        let result = CurrencyHelper.format(amount: number)
        
        XCTAssertEqual(result, "€ 130,00")
    }

    func testFormat_WhenAmountIsRegularNumber_ShouldReturnCurrencyNumberWithDecimal() {
        let number: NSNumber = 122
        let result = CurrencyHelper.format(amount: number)
        
        XCTAssertEqual(result, "€ 122,00")
    }

    func testFormat_WhenAmountIsDecimalNumber_ShouldReturnCurrencyUsingDecimalSeparator() {
        let number: NSNumber = 122.50
        let result = CurrencyHelper.format(amount: number)
        
        XCTAssertEqual(result, "€ 122,50")
    }
    
    func testFormat_WhenAmountHasThousands_ShouldReturnDutchThousandsSeparator() {
        let number: NSNumber = 99999998
        let result = CurrencyHelper.format(amount: number)
        
        XCTAssertEqual(result, "€ 99.999.998,00")
    }
    
    func testFormat_WhenAmountIsZero_ShouldReturnZeroCurrencyValue() {
        let number: NSNumber = 0
        let result = CurrencyHelper.format(amount: number)

        XCTAssertEqual(result, "€ 0,00")
    }

    func testFormat_WhenAmountIsNegative_ShouldReturnNegativeCurrencyValue() {
        let number: NSNumber = -122.50
        let result = CurrencyHelper.format(amount: number)

        XCTAssertEqual(result, "€ -122,50")
    }

    // MARK: - Attributed string

    func testAttributify_WhenInputIsFormattedAsCurrency_ShouldReturnOriginalString() {
        let input = "€ 99.999.998,00"
        let result = CurrencyHelper.attributify(amount: input)
        
        XCTAssertEqual(result.string, input)
    }

    // TODO: Enable when CurrencyHelper.attributify handles an empty input safely.
    // Current behavior creates an invalid NSRange and crashes.
    // func testAttributify_WhenInputIsEmpty_ShouldReturnEmptyString() {
    //     let result = CurrencyHelper.attributify(amount: "")
    //
    //     XCTAssertEqual(result.string, "")
    // }

}
