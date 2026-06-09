//
//  ViewController.swift
//  ReferenceiOS
//
//  Created by Dunya Kirkali on 27/03/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ensure the button title scales correctly with Dynamic Type
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        setupAccessibilityIdentifiers()
    }

    private func setupAccessibilityIdentifiers() {
        label.accessibilityIdentifier = "landingScreen.amountLabel"
        button.accessibilityIdentifier = "landingScreen.generateButton"
    }

    @IBAction func generate(_ sender: Any) {
        let amount = randomDecimal(in: 100...99999999)
        let nsAmount = amount as NSDecimalNumber

        // Apply formatting and accessibility properties to the amount label
        if let formattedAmount = CurrencyHelper.format(amount: nsAmount) {
            label.attributedText = CurrencyHelper.attributify(amount: formattedAmount)
            label.accessibilityLabel = formattedAmount
            label.adjustsFontForContentSizeCategory = true
        }
    }
    
    /// Generates a random decimal value within a specified range for UI display purposes
    func randomDecimal(in range: ClosedRange<Double>) -> Decimal {
        let randomDouble = Double.random(in: range)
        return Decimal(randomDouble)
    }
    
    #if DEBUG
    /// Injects a specific amount into the UI for snapshot testing consistency
    func configureForSnapshotTest(with amount: Double) {
        let decimalAmount = Decimal(amount)
        if let formattedAmount = CurrencyHelper.format(amount: decimalAmount as NSDecimalNumber) {
            label.attributedText = CurrencyHelper.attributify(amount: formattedAmount)
        }
    }
    #endif
}
