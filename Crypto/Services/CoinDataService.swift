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
    
    private func getAllCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h") else { return }
        
        subscriber = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { output -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode <  300 else {
                    throw URLError(.badServerResponse)
                }

                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    print("🍎🍎")
                case .failure(let error):
                    print("🍎🍎🍎\(error)")
                }
            } receiveValue: { [weak self] data in
                self?.allCoins = data
                self?.subscriber?.cancel()
            }
    }
}
