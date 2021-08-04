//
//  CoinDataService.swift
//  Crypto
//
//  Created by Maxim Granchenko on 11.06.2021.
//

import Foundation
import Combine

//url = https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h

class CoinDataService {
    @Published var allCoins: [CoinModel] = []
    
    var subscriber: AnyCancellable?
    
    init() {
        getAllCoins()
    }
    
    func getAllCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h") else { return }
        
        subscriber = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnCoins in
                self?.allCoins = returnCoins
                self?.subscriber?.cancel()
            })
    }
}
