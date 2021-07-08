//
//  XMarkView.swift
//  Crypto
//
//  Created by Maxim Granchenko on 08.07.2021.
//

import SwiftUI

struct XMarkView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

struct XMarkView_Previews: PreviewProvider {
    static var previews: some View {
        XMarkView()
    }
}
