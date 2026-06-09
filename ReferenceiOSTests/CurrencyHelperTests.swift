//
//  CurrencyHelperTests.swift
//  ReferenceiOSTests
//
//  Created by Dunya Kirkali on 27/03/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import XCTest
@testable import ReferenceiOS

final class CurrencyHelperTests: XCTestCase {

    // MARK: - Currency formatting

    func testFormatRounding() {
        let result = CurrencyHelper.format(amount: 129.999)
        XCTAssertEqual(result, "€ 130,00")
    }

    func testFormatRegular() {
        let result = CurrencyHelper.format(amount: 122)
        XCTAssertEqual(result, "€ 122,00")
    }

    func testFormatDecimals() {
        let result = CurrencyHelper.format(amount: 122.50)
        XCTAssertEqual(result, "€ 122,50")
    }

    func testFormatZero() {
        let result = CurrencyHelper.format(amount: 0)
        XCTAssertEqual(result, "€ 0,00")
    }

    func testFormatLargeNumber() {
        let result = CurrencyHelper.format(amount: 1_000_000)
        XCTAssertEqual(result, "€ 1.000.000,00")
    }

    func testFormatLargeDecimalNumber() {
        let result = CurrencyHelper.format(amount: 1_000_000.99)
        XCTAssertEqual(result, "€ 1.000.000,99")
    }

    func testFormatNegative() {
        let result = CurrencyHelper.format(amount: -50)
        XCTAssertEqual(result, "€ -50,00")
    }

    func testFormatNegativeDecimal() {
        let result = CurrencyHelper.format(amount: -50.75)
        XCTAssertEqual(result, "€ -50,75")
    }

    func testFormatRoundingEdgeCase() {
        let result = CurrencyHelper.format(amount: 129.994)
        XCTAssertEqual(result, "€ 129,99")
    }

    func testFormatRoundingUpEdgeCase() {
        let result = CurrencyHelper.format(amount: 129.995)
        XCTAssertEqual(result, "€ 130,00")
    }

    func testFormatRoundDownToZero() {
        let result = CurrencyHelper.format(amount: 0.004)
        XCTAssertEqual(result, "€ 0,00")
    }

    func testFormattedCurrencyContainsEuroSymbol() {
        let result = CurrencyHelper.format(amount: 100)
        XCTAssertTrue(result?.contains("€") == true)
    }
    
    func testAttributifyEmptyString() {
        let result = CurrencyHelper.attributify(amount: "")
        XCTAssertEqual(result.string, "")
    }

    func testAttributifyShortString() {
        let result = CurrencyHelper.attributify(amount: "1")
        XCTAssertEqual(result.string, "1")
    }

    // MARK: - Attributed string

    func testAttributifyPreservesOriginalString() {
        let input = "€ 122,50"

        let result = CurrencyHelper.attributify(amount: input)

        XCTAssertEqual(result.string, input)
    }

    func testAttributifyAppliesSuperscriptFont() {
        let input = "€ 122,50"

        let result = CurrencyHelper.attributify(amount: input)

        let decimalStart = input.count - CurrencyHelper.decimalCount

        let font = result.attribute(
            .font,
            at: decimalStart,
            effectiveRange: nil
        )

        XCTAssertNotNil(font)
    }
}

