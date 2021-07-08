//
//  SaveButton.swift
//  Crypto
//
//  Created by Maxim Granchenko on 08.07.2021.
//

import SwiftUI

struct SaveButtonView: View {
    var handle: () -> ()
    
    var body: some View {
        Button(action: {
            handle()
        }, label: {
            HStack {
                Image(systemName: "checkmark")
                Text("Save")
            }
            .font(.headline)
        })
    }
}

struct SaveButton_Previews: PreviewProvider {
    static var previews: some View {
        SaveButtonView(handle: {})
            .previewLayout(.sizeThatFits)
    }
}
