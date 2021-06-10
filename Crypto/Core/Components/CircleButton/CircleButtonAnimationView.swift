//
//  CircleButtonAnimationView.swift
//  Crypto
//
//  Created by Maxim Granchenko on 10.06.2021.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? 1 : 0)
            .opacity(animate ? 0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1) : .none)
            .onAppear(perform: {
                animate.toggle()
            })
    }
}

struct CircleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationView(animate: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
