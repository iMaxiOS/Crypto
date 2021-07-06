//
//  MarketDataService.swift
//  Crypto
//
//  Created by Maxim Granchenko on 06.07.2021.
//

import Foundation
import Combine

class MarketDataService {
    @Published var marketData: MarketDataModel? = nil
    
    var marketDataSubscriber: AnyCancellable?
    
    init() {
        getMarketData()
    }
    
    private func getMarketData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        
        marketDataSubscriber = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnMarketData in
                self?.marketData = returnMarketData.data
                self?.marketDataSubscriber?.cancel()
            })
    }
}
