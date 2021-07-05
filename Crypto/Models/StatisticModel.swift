//
//  StatisticModel.swift
//  Crypto
//
//  Created by Maxim Granchenko on 05.07.2021.
//

import Foundation

struct StatisticModel {
    var id = UUID().uuidString
    var title: String
    var value: String
    var percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange 
    }
}
