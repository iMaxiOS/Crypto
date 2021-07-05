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
    private let localFileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let saveImage = localFileManager.getImage(imageName: imageName, folderName: folderName) {
            image = saveImage
            print("🍎🍎🍎 Retrieved image from fileManager")
        } else {
            downloadCoinImage()
            print("🍎🍎🍎 Download image now")
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscriber = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnImage in
                guard let self = self, let downloadImage = returnImage else { return }
                self.image = returnImage
                self.imageSubscriber?.cancel()
                self.localFileManager.saveImage(image: downloadImage, folderName: self.folderName, imageName: self.imageName)
            })
    }
}
