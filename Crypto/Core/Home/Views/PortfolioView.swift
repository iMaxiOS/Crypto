//
//  PortfolioView.swift
//  Crypto
//
//  Created by Maxim Granchenko on 08.07.2021.
//

import SwiftUI

struct PortfolioView: View {
    @EnvironmentObject var vm: HomeViewModel
    @State private var selectedCoin: CoinModel? = nil
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    SearchBarView(search: $vm.searchText)
                    
                    selectedCoinView
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkView()
                }
            })
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}

extension PortfolioView {
    private var selectedCoinView: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHStack(spacing: 10, content: {
                ForEach(vm.allCoins) { coin in
                    VStack {
                        CoinLogoView(coin: coin)
                            .frame(width: 75)
                            .padding(4)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    selectedCoin = coin
                                }
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(selectedCoin?.id == coin.id ? Color.theme.green : Color.clear, lineWidth: 1.0)
                            )
                    }
                }
            })
            .padding(.vertical, 4)
            .padding(.horizontal)
        })
    }
}
