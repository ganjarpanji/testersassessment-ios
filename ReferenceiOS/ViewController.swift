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
        
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        setupAccessibilityIdentifiers()
    }

    private func setupAccessibilityIdentifiers() {
        label.accessibilityIdentifier = "landingScreen.amountLabel"
        button.accessibilityIdentifier = "landingScreen.generateButton"
    }

    @IBAction func generate(_ sender: Any) {
        // Generate amount
        let amount = randomDecimal(in: 100...99999999)
        let nsAmount = amount as NSDecimalNumber

        // Format label
        if let formattedAmount = CurrencyHelper.format(amount: nsAmount) {
            label.attributedText = CurrencyHelper.attributify(amount: formattedAmount)
            label.accessibilityLabel = formattedAmount
            label.adjustsFontForContentSizeCategory = true
        }
    }
    
    // Generate random decimal
    func randomDecimal(in range: ClosedRange<Double>) -> Decimal {
        let randomDouble = Double.random(in: range)
        return Decimal(randomDouble)
    }
    
    #if DEBUG
        // Inject amount based on test data
        func configureForSnapshotTest(with amount: Double) {
            let decimalAmount = Decimal(amount)
            if let formattedAmount = CurrencyHelper.format(amount: decimalAmount as NSDecimalNumber) {
                label.attributedText = CurrencyHelper.attributify(amount: formattedAmount)
            }
        }
    #endif
}
