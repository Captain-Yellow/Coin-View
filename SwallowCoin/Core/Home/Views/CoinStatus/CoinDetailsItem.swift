//
//  CoinDetailsItem.swift
//  SwallowCoin
//
//  Created by Mohammad Afshar on 31/10/2023.
//

import SwiftUI

struct CoinDetailsItem: View {
    let model: CoinDetailsModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(model.title)
                .font(.caption)
            
            Text(model.value)
                .bold()
            
            if let percent = model.percentageChange {
                HStack(alignment: .center) {
                    Image(systemName: "triangle.fill")
                        .font(.caption)
                    
                    Text(percent.percentageToString())
                }
                .foregroundStyle(.green)
            }
        }
    }
}

#Preview {
    CoinDetailsItem(model: DeveloperPreview.instance.stat1)
}
