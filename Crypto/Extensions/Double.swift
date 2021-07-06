//
//  Double.swift
//  Crypto
//
//  Created by Maxim Granchenko on 10.06.2021.
//

import Foundation

extension Double {
    var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter ()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumIntegerDigits = 2
        formatter.maximumIntegerDigits = 2
        return formatter
    }
    
    func asCurrencyWith2Decimal() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2 .string(from: number) ?? "0.00"
    }
    
    var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter ()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumIntegerDigits = 2
        formatter.maximumIntegerDigits = 6
        return formatter
    }
    
    func asCurrencyWith6Decimal() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "0.00"
    }
    
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
    
    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""

        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Bn"
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)M"
        case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.asNumberString()

        default:
            return "\(sign)\(self)"
        }
    }
}
