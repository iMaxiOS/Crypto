//
//  StatisticView.swift
//  Crypto
//
//  Created by Maxim Granchenko on 05.07.2021.
//

import SwiftUI

struct StatisticView: View {
    
    let stat: StatisticModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4, content: {
                Text(stat.title)
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
                
                Text(stat.value)
                    .font(.headline)
                    .foregroundColor(Color.theme.accent)
                
                HStack(spacing: 3) {
                    Image(systemName: "triangle.fill")
                        .font(.caption2)
                        .rotationEffect(Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180))
                    Text(stat.percentageChange?.asPercentString() ?? "")
                        .font(.caption)
                        .bold()
                }
                .foregroundColor((stat.percentageChange ?? 0 >= 0 ? Color.theme.green : Color.theme.red))
                .opacity(stat.percentageChange == nil ? 0 : 1)
            })
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatisticView(stat: DeveloperPreview.share.static1)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            StatisticView(stat: DeveloperPreview.share.static2)
                .previewLayout(.sizeThatFits)
            StatisticView(stat: DeveloperPreview.share.static3)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
