//
//  String.swift
//  Crypto
//
//  Created by Maxim Granchenko on 27.07.2021.
//

import Foundation

extension String {
    var removingHTMLOccurrences: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
