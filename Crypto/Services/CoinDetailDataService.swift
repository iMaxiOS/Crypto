//
//  CoinDetailDataService.swift
//  Crypto
//
//  Created by Maxim Granchenko on 09.07.2021.
//

import Foundation
import Combine

class CoinDetailDataService: ObservableObject {
    
    @Published var coinDetailModel: CoinDetailModel? = nil
    
    var subscriber: Cancellable? = nil
    var coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        
        getCoinDetail()
    }
    
    
    private func getCoinDetail() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else {
            return
        }
        
        subscriber = NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnCoinDetail in
                self?.coinDetailModel = returnCoinDetail
                self?.subscriber?.cancel()
            })
    }
}
