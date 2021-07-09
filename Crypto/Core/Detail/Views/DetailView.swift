//
//  DetailView.swift
//  Crypto
//
//  Created by Maxim Granchenko on 09.07.2021.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    
    @ObservedObject var vm: DetailViewModel
    
    init(coin: CoinModel) {
        _vm = ObservedObject(wrappedValue: DetailViewModel(coin: coin))
        print("🍎🍎🍎 Initiation Detail View for \(coin.name)")
    }
    
    var body: some View {
        Text("`hello")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
