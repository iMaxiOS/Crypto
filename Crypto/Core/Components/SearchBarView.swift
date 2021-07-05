//
//  SearchBarVIew.swift
//  Crypto
//
//  Created by Maxim Granchenko on 05.07.2021.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var search: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(search.isEmpty ? Color.theme.secondaryText : Color.theme.accent)
            
            TextField("Search by name or symbol", text: $search)
                .foregroundColor(Color.theme.accent)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.theme.accent)
                        .opacity(search.isEmpty ? 0 : 1)
                        .onTapGesture {
                            UIApplication.shared.endEditing() 
                            search = ""
                        }
                    , alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.15), radius: 10, x: 0.0, y: 0.0)
        )
        .padding([.horizontal, .bottom])
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchBarView(search: .constant(""))
                
            SearchBarView(search: .constant(""))
                .preferredColorScheme(.dark)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
