//
//  CurrencyHelper.swift
//  ReferenceiOS
//
//  Created by Dunya Kirkali on 27/03/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import UIKit

class CurrencyHelper {
    static let regularSize: CGFloat = 18
    static let superscriptSize: CGFloat = 13
    static let diff: CGFloat = 2
    static let decimalCount = 2

    static func format(amount: NSNumber) -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "nl_NL")
        formatter.numberStyle = .currency
        return formatter.string(from: amount)
    }
    
    static func attributify(amount: String) -> NSMutableAttributedString {
        
        let font = UIFont(name: "Helvetica", size: regularSize) ?? UIFont.systemFont(ofSize: regularSize)
        let fontDynamic = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        
        let fontSuper = UIFont(name: "Helvetica", size: superscriptSize) ?? UIFont.systemFont(ofSize: superscriptSize)
        let fontSuperDynamic = UIFontMetrics(forTextStyle: .body).scaledFont(for: fontSuper)
        
        // Add .foregroundColor for darkmode
        let baseAttributes: [NSAttributedString.Key: Any] = [
            .font: fontDynamic,
            .foregroundColor: UIColor.label
        ]
        let attString = NSMutableAttributedString(string: amount, attributes: baseAttributes)
        
        guard amount.count >= decimalCount else {
            return attString
        }
        
        let superAttributes: [NSAttributedString.Key: Any] = [
            .font: fontSuperDynamic,
            .baselineOffset: (fontDynamic.pointSize - fontSuperDynamic.pointSize) - diff,
            .foregroundColor: UIColor.label
        ]
        
        attString.setAttributes(superAttributes, range: NSRange(location: (amount.count - decimalCount), length: decimalCount))
        
        return attString
    }
}
