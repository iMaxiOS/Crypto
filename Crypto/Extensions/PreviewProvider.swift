//
//  PreviewProvider.swift
//  Crypto
//
//  Created by Maxim Granchenko on 10.06.2021.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.share
    }
}

class DeveloperPreview {
    static var share = DeveloperPreview()
    private init() { }
    
    let homeVM = HomeViewModel()
    
    let static1 = StatisticModel(title: "BTC", value: "USA", percentageChange: 45)
    let static2 = StatisticModel(title: "ADA", value: "Peru")
    let static3 = StatisticModel(title: "DOGE", value: "Ukraine", percentageChange: -23.5)
    
    let coin = CoinModel(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
        currentPrice: 38313,
        marketCap: 719503791248,
        marketCapRank: 1,
        fullyDilutedValuation: 806638796167,
        totalVolume: 54178444401,
        high24H: 38407,
        low24H: 34191,
        priceChange24H: 4122.13,
        priceChangePercentage24H: 12.05633,
        marketCapChange24H: 81018080032,
        marketCapChangePercentage24H: 12.6891,
        circulatingSupply: 18731531,
        totalSupply: 21000000,
        maxSupply: 21000000,
        ath: 64805,
        athChangePercentage: -40.72751,
        athDate: "2021-04-14T11:54:46.763Z",
        atl: 67.81,
        atlChangePercentage: 56546.42045,
        atlDate: "2013-07-06T00:00:00.000Z",
        lastUpdated: "2021-06-10T10:24:13.208Z",
        sparklineIn7D: SparklineIn7D(price: [38845.95090301609, 38768.500118200194]),
        priceChangePercentage24HInCurrency: 12.0563278092054,
        currentHoldings: 1.5
    )
}
