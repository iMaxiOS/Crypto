//
//  CoinImageView.swift
//  Crypto
//
//  Created by Maxim Granchenko on 11.06.2021.
//

import SwiftUI

struct CoinImageView: View {
    @StateObject var vm: CoinImageViewModel
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "quistionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}



