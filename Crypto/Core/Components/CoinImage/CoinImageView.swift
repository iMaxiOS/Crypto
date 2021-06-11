//
//  CoinImageView.swift
//  Crypto
//
//  Created by Maxim Granchenko on 11.06.2021.
//

import SwiftUI

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading = false
    
    init() {
        
    }
    
    private func getImage() {
         
    }
}

struct CoinImageView: View {
    @StateObject var vm: CoinImageViewModel = CoinImageViewModel()
    
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



