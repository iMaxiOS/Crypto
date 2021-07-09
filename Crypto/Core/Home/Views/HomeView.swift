//
//  HomeView.swift
//  Crypto
//
//  Created by Maxim Granchenko on 10.06.2021.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio = true
    @State private var showPortfolioView = false
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView, content: {
                    PortfolioView()
                        .environmentObject(vm)
                })
            
            VStack {
                headerView
                
                HomeStatisticView(showPortfolio: $showPortfolio)
                
                SearchBarView(search: $vm.searchText)
                
                columnTitles
                
                if !showPortfolio {
                    allCoinsListView
                        .transition(.move(edge: .leading))
                }
                
                if showPortfolio {
                    portfolioCoinsListView
                        .transition(.move(edge: .trailing))
                }
                
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}

extension HomeView {
    private var headerView: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info", handleCompletion: {
                if showPortfolio {
                    showPortfolioView.toggle()
                }
            })
            .background(CircleButtonAnimationView(animate: $showPortfolio))
            .animation(.none)
            
            Spacer()
            
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            
            Spacer()
            
            CircleButtonView(iconName: "chevron.right", handleCompletion: {
                withAnimation(.spring()) {
                    showPortfolio.toggle()
                }
            })
            .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
        }
        .padding(.horizontal)
    }
    
    private var allCoinsListView: some View {
        List {
            ForEach(vm.allCoins) { coin in
                NavigationLink(
                    destination: DetailView(coin: coin),
                    label: {
                        CoinRowView(coin: coin, showHoldingCalumn: false)
                            .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    })
                
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var portfolioCoinsListView: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingCalumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var columnTitles: some View {
        HStack {
            HStack(spacing: 4) {
                Text("Coin")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .rank || vm.sortOption == .rankReversed) ? 1 : 0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 180 : 0))
                    .animation(.easeIn)
            }
            .onTapGesture {
                vm.sortOption = vm.sortOption == .rank ? .rankReversed : .rank
            }

            Spacer()
            
            if showPortfolio {
                HStack(spacing: 4) {
                    Text("Holdings")
                    Image(systemName: "chevron.down")
                        .opacity((vm.sortOption == .holdings || vm.sortOption == .holdingsReversed) ? 1 : 0)
                        .rotationEffect(Angle(degrees: vm.sortOption == .holdings ? 180 : 0))
                        .animation(.easeIn)
                }
                .onTapGesture {
                    vm.sortOption = vm.sortOption == .holdings ? .holdingsReversed : .holdings
                }
            }
            
            HStack(spacing: 4) {
                Text("Price")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .price || vm.sortOption == .priceReversed) ? 1 : 0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .price ? 180 : 0))
                    .animation(.easeIn)
            }
            .onTapGesture {
                vm.sortOption = vm.sortOption == .price ? .priceReversed : .price
            }
            .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
