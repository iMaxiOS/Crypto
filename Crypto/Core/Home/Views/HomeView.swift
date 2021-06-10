//
//  HomeView.swift
//  Crypto
//
//  Created by Maxim Granchenko on 10.06.2021.
//

import SwiftUI

struct HomeView: View {
    @State private var showPortfolio = false
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                headerView
                
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
    }
}

extension HomeView {
    private var headerView: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .background(CircleButtonAnimationView(animate: $showPortfolio))
                .animation(.none)
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}
