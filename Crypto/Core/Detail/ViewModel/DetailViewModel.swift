//
//  DetailViewModel.swift
//  Crypto
//
//  Created by Maxim Granchenko on 09.07.2021.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    @Published var overviewStatistics: [StatisticModel] = []
    @Published var additionalStatistics: [StatisticModel] = []
    @Published var coin: CoinModel
    @Published var coinDescription: String? = nil
    @Published var websiteURL: String? = nil
    @Published var redditURL: String? = nil
    
    private let coinDetailDataService: CoinDetailDataService
    private var cancelable = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.coinDetailDataService = CoinDetailDataService(coin: coin)
        
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailDataService.$coinDetailModel
            .combineLatest($coin)
            .map(overviewAndAdditional)
            .sink { returnCoin in
                self.overviewStatistics = returnCoin.overview
                self.additionalStatistics = returnCoin.additional
            }
            .store(in: &cancelable)
        
        coinDetailDataService.$coinDetailModel
            .sink { [weak self] returnCoinDetail in
                self?.coinDescription = returnCoinDetail?.readableDescription
                self?.websiteURL = returnCoinDetail?.links?.homepage?.first
                self?.redditURL = returnCoinDetail?.links?.subredditURL
            }
            .store(in: &cancelable)
    }
    
    func overviewAndAdditional(coinDetailModel: CoinDetailModel?, coinModel: CoinModel) -> (overview: [StatisticModel], additional: [StatisticModel]) {
        return (createOverviewArray(coinModel: coinModel), createAdditionalArray(coinDetailModel: coinDetailModel, coinModel: coinModel))
    }
    
    private func createOverviewArray(coinModel: CoinModel) -> [StatisticModel] {
        let price =  coinModel.currentPrice.asCurrencyWith6Decimal()
        let priceChange = coinModel.priceChangePercentage24H
        let priceState = StatisticModel(title: "Current Price", value: price, percentageChange: priceChange)
        
        let marketCap = "$" + (coinModel.marketCap?.formattedWithAbbreviations() ?? "")
        let marketCapChange = coinModel.marketCapChangePercentage24H
        let marketCapState = StatisticModel(title: "Market Capitalisation", value: marketCap, percentageChange: marketCapChange)
        
        let rank = "\(coinModel.rank)"
        let rankState = StatisticModel(title: "Rank", value: rank)
        
        let volume = "$" + (coinModel.totalVolume?.formattedWithAbbreviations() ?? "")
        let volumeState = StatisticModel(title: "Volume", value: volume)
        
        return [priceState, marketCapState, rankState, volumeState]
    }
    
    private func createAdditionalArray(coinDetailModel: CoinDetailModel?, coinModel: CoinModel) -> [StatisticModel] {
        let high = coinModel.high24H?.asCurrencyWith6Decimal() ?? "n/a"
        let highState = StatisticModel(title: "24h High", value: high)
        
        let low = coinModel.low24H?.asCurrencyWith6Decimal() ?? "n/a"
        let lowState = StatisticModel(title: "24h Low", value: low)
        
        let priceChange = coinModel.priceChange24H?.asCurrencyWith6Decimal() ?? "n/a"
        let pricePercentChange = coinModel.priceChangePercentage24H
        let priceChangeState = StatisticModel(title: "24h Price Change", value: priceChange, percentageChange: pricePercentChange)
        
        let marketPriceChange = "$" + (coinModel.marketCapChange24H?.formattedWithAbbreviations() ?? "")
        let marketPercentChange = coinModel.marketCapChangePercentage24H
        let marketChangeState = StatisticModel(title: "24h Market Cap Change", value: marketPriceChange, percentageChange: marketPercentChange)
        
        let blockTime = coinDetailModel?.blockTimeInMinutes ?? 0
        let blockTimeString = blockTime == 0 ? "n/a" : "\(blockTime)"
        let blockState = StatisticModel(title: "Block Time", value: blockTimeString)
        
        let hashing = coinDetailModel?.hashingAlgorithm ?? "n/a"
        let hashingState = StatisticModel(title: "Hashing Algorithm", value: hashing)
        
        return [highState, lowState, priceChangeState, marketChangeState, blockState, hashingState]
    }
    
}
