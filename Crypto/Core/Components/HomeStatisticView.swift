//
//  HomeStatisticView.swift
//  Crypto
//
//  Created by Maxim Granchenko on 05.07.2021.
//

import SwiftUI

struct HomeStatisticView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.statistics, id: \.id) { stat in
                StatisticView(stat: stat)
            }
            .frame(width: UIScreen.main.bounds.width / 3)
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .trailing : .leading)
        .padding(.bottom)
    }
}

struct HomeStatisticView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeStatisticView(showPortfolio: .constant(false))
                .previewLayout(.sizeThatFits)
                .environmentObject(dev.homeVM)
            HomeStatisticView(showPortfolio: .constant(false))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
                .environmentObject(dev.homeVM)
        }
    }
}
