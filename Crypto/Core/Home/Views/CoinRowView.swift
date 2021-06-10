//
//  CoinRowView.swift
//  Crypto
//
//  Created by Maxim Granchenko on 10.06.2021.
//

import SwiftUI

struct CoinRowView: View {
    var coin: CoinModel
    var showHoldingCalumn: Bool
    
    var body: some View {
        HStack {
            leftColumn
            
            Spacer()
            
            if showHoldingCalumn {
                centerColumn
            }
            
            rightColumn
        }
        .font(.subheadline)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowView(coin: dev.coin, showHoldingCalumn: true)
                .previewLayout(.sizeThatFits)

            CoinRowView(coin: dev.coin, showHoldingCalumn: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)

        }
    }
}

extension CoinRowView {
    private var leftColumn: some View {
        HStack {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(width: 30, height: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingValue.asCurrencyWith2Decimal())
                .bold()
            Text((coin.currentHoldings ?? 0).asPercentString())
        }
        .foregroundColor(Color.theme.accent)
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimal())
                .bold()
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24HInCurrency?.asPercentString() ?? "")
                .foregroundColor(
                    (coin.priceChangePercentage24HInCurrency ?? 0) >= 0 ? Color.theme.green : Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
