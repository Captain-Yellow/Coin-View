//
//  TopMoverItem.swift
//  SwallowCoin
//
//  Created by Mohammad Afshar on 13/10/2023.
//

import SwiftUI
import Kingfisher

struct TopMoverItem: View {
    var coin: CoinDataModel
    
    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.bottom, 5)
            
            HStack(spacing: 5) {
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.primary)
                
                Text(coin.currentPrice.toCurrency())
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
            }
            
            Text(coin.priceChangePercentage24H?.percentageToString() ?? "0%")
                .font(.system(size: 25))
                .font(.headline)
                .bold()
                .foregroundStyle(coin.priceChangePercentage24H ?? 0 > 0 ? .green : .gray)
        }
        .frame(width: 150, height: 150)
        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color(PrimeryColors.backgroundColor)))
        .overlay {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .stroke(Color.gray, lineWidth: 2)
        }
    }
}
//
//#Preview(/*traits: .sizeThatFitsLayout*/) {
//    TopMoverItem()
//}
