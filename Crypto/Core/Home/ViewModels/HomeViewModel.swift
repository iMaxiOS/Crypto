//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Maxim Granchenko on 10.06.2021.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    private var dataService = CoinDataService()
    private var cancelable = Set<AnyCancellable>()
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] returnCoins in
                self?.allCoins = returnCoins
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
    
}
