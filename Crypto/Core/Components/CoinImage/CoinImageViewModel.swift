//
//  CoinImageViewModel.swift
//  Crypto
//
//  Created by Maxim Granchenko on 11.06.2021.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading = false
    
    private let coinModel: CoinModel
    private let coinImageService: CoinImageService
    private var cancellable = Set<AnyCancellable>()
    
    
    init(coin: CoinModel) {
        self.coinModel = coin
        self.coinImageService = CoinImageService(coin: coin)
        self.isLoading = true
        
        addSubscribers()
    }
    
    private func addSubscribers() {
        coinImageService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnImage in
                self?.image = returnImage
            }
            .store(in: &cancellable)
    }
}
