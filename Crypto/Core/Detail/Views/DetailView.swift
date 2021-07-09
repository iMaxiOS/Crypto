//
//  DetailView.swift
//  Crypto
//
//  Created by Maxim Granchenko on 09.07.2021.
//

import SwiftUI

struct DetailView: View {
    var coin: CoinModel
    
    var body: some View {
        Text(coin.name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
