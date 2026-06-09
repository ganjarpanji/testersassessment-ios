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
        
        setupAccessibilityIdentifiers()
    }

    private func setupAccessibilityIdentifiers() {
        label.accessibilityIdentifier = "landingScreen.amountLabel"
        button.accessibilityIdentifier = "landingScreen.generateButton"
    }

    @IBAction func generate(_ sender: Any) {
        // Generate amount
        let amount = Float.random(in: 100 ..< 99999999)

        // Format
        if let formattedAmount = CurrencyHelper.format(amount: amount as NSNumber) {
            label.attributedText = CurrencyHelper.attributify(amount: formattedAmount)
        }
    }
}
