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
    
    @ObservedObject private var vm: DetailViewModel
    
    @State private var showFullDescription = false
    
    private let lazyGrid: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(coin: CoinModel) {
        _vm = ObservedObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack {
                ChartView(coin: vm.coin)
                    .padding(.vertical)
                descriptionSection
                overviewGridView
                additionalDetailView
                Divider()
                additionalGridView
                bottomSectionLinks
            }
            .padding()
        })
        .navigationTitle(vm.coin.name)
        .background(Color.theme.background.ignoresSafeArea())
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                navigationBarButton
            }
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(coin: dev.coin)
        }
    }
}

extension DetailView {
    
    private var navigationBarButton: some View {
        HStack {
            Text(vm.coin.symbol.uppercased())
                .font(.headline)
                .foregroundColor(Color.theme.secondaryText)
            
            CoinImageView(coin: vm.coin)
                .frame(width: 30, height: 30)
        }
    }
    
    private var overviewStatView: some View {
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var additionalDetailView: some View {
        Text("Additional Details")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var descriptionSection: some View {
        VStack(spacing: 20) {
            overviewStatView
            Divider()
            
            ZStack {
                if let coinDescription = vm.coinDescription, !coinDescription.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(coinDescription)
                            .font(.callout)
                            .foregroundColor(Color.theme.secondaryText)
                            .lineLimit(showFullDescription ? nil : 3)
                        
                        Button(action: {
                            withAnimation(.easeInOut) {
                                showFullDescription.toggle()
                            }
                        }, label: {
                            Text(showFullDescription ? "Less" : "Read more...")
                                .font(.caption)
                                .fontWeight(.bold)
                                .padding(.vertical, 4)
                        })
                        .accentColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                }
            }
        }
    }
    
    private var overviewGridView: some View {
        LazyVGrid(columns: lazyGrid, alignment: .leading, spacing: 30, pinnedViews: [], content: {
            ForEach(vm.overviewStatistics, id: \.self) { stat in
                StatisticView(stat: stat)
            }
        })
    }
    
    private var additionalGridView: some View {
        LazyVGrid(columns: lazyGrid, alignment: .leading, spacing: 30, pinnedViews: [], content: {
            ForEach(vm.additionalStatistics, id: \.self) { stat in
                StatisticView(stat: stat)
            }
        })
    }
    
    private var bottomSectionLinks: some View {
        VStack(alignment: .leading, spacing: 20) {
            if let websiteString = vm.websiteURL, let url = URL(string: websiteString) {
                Link("Website", destination: url)
            }
            
            if let redditString = vm.redditURL, let url = URL(string: redditString) {
                Link("Reddit", destination: url)
            }
        }
        .accentColor(.blue)
        .font(.system(size: 16, weight: .bold))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
