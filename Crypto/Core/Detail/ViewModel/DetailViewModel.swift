//
//  DetailViewModel.swift
//  Crypto
//
//  Created by Maxim Granchenko on 09.07.2021.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    private let coinDetailDataService: CoinDetailDataService
    private var cancelable = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coinDetailDataService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailDataService.$coinDetailModel
            .sink { returnCoin in
                print("🍎🍎🍎")
                print("🍎🍎🍎\(returnCoin)")
            }
            .store(in: &cancelable)
    }
    
}
