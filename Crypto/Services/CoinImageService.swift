//
//  CoinImageService.swift
//  Crypto
//
//  Created by Maxim Granchenko on 11.06.2021.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscriber: AnyCancellable?
    private var coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        
        getCoinImage()
    }
    
    private func getCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscriber = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnImage in
                self?.image = returnImage
                self?.imageSubscriber?.cancel()
            })
    }
}
