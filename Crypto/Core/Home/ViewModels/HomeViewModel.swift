//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Maxim Granchenko on 10.06.2021.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistics: [StatisticModel] = []
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    private var coinDataService = CoinDataService()
    private var marketDataService = MarketDataService()
    private var cancelable = Set<AnyCancellable>()
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] returnCoins in
                self?.allCoins = returnCoins
            }
            .store(in: &cancelable)
        
        marketDataService.$marketData
            .map(marketData)
            .sink { [weak self] returnStats in
                self?.statistics = returnStats
            }
            .store(in: &cancelable)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        
        let lowercasedText = text.lowercased()
        
        return coins.filter { coin  in
            return coin.name.contains(lowercasedText) || coin.id.contains(lowercasedText) || coin.symbol.contains(lowercasedText)
        }
    }
    
    private func marketData(marketData: MarketDataModel?) -> [StatisticModel] {
        var stats: [StatisticModel] = []
        
        guard let data = marketData else { return stats }
        
        let item = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = StatisticModel(title: "24h Volume", value: data.volume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        let portfolio = StatisticModel(title: "Portfolio Stats", value: "$0.00", percentageChange: 0)
        stats.append(contentsOf: [
            item, volume, btcDominance, portfolio
        ])
        
        return stats
    }
    
}
