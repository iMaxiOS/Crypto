//
//  SettingsView.swift
//  Crypto
//
//  Created by Maxim Granchenko on 04.08.2021.
//

import SwiftUI

struct SettingsView: View {
    
    private let defaultUrl = URL(string: "https://www.google.com")!
    private let youtubeUrl = URL(string: "https://www.youtube.com")!
    private let coffeeUrl = URL(string: "https://www.buymeacoffee.com")!
    private let coingeckoUrl = URL(string: "https://www.coingecko.com/en")!
    private let instagramUrl = URL(string: "https://www.instagram.com/m.granchenko/")!
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                
                List {
                    swiftThinkingSectionView
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    coingeckoSectionView
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    developerSectionView
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    searchingInformationSectionView
                        .listRowBackground(Color.theme.background.opacity(0.5))
                }
            }
            .font(.headline)
            .accentColor(.blue)
            .navigationTitle("Settings")
            .listStyle(GroupedListStyle())
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkView()
                }
            }
            .background(Color.theme.background.ignoresSafeArea())
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    private var swiftThinkingSectionView: some View {
        Section(header: Text("Swift Thinking")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                
                Text("This app was made by iMakca. It uses MVVM Architecture, Combine and CoreData!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            
            Link("Youtube 🎥", destination: youtubeUrl)
            Link("Coffee ☕️", destination: coffeeUrl)
        }
    }
    
    private var coingeckoSectionView: some View {
        Section(header: Text("Coin Gecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                
                Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            
            Link("Visit API CoinGecko 🦎", destination: coingeckoUrl)
        }
    }
    
    private var developerSectionView: some View {
        Section(header: Text("Instagram")) {
            VStack(alignment: .leading) {
                Image("instagram_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                
                Text("This app was developed by iMakca. It uses SwiftUI and is written 100% in Swift. The project benefits from multi-threading, publishers/subscribers, and data persistence.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            
            Link("Subscribe on Instagram 📸", destination: instagramUrl)
        }
    }
    
    private var searchingInformationSectionView: some View {
        Section(header: Text("Application")) {
            Link("Terms of Service", destination: defaultUrl)
            Link("Privacy Policy", destination: defaultUrl)
            Link("Company Website", destination: defaultUrl)
            Link("Learn more...", destination: defaultUrl)
        }
    }
}
