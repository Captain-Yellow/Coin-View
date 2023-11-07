//
//  AllCoinsItem.swift
//  SwallowCoin
//
//  Created by Mohammad Afshar on 14/10/2023.
//

import SwiftUI
import Kingfisher

struct AllCoinsItem: View {
    internal var coinData: CoinDataModel
    
    var body: some View {
        HStack {
            Text("\(coinData.marketCapRank ?? 0)")
                .bold()
                .foregroundStyle(.gray)
            
            KFImage(URL(string: coinData.image))
                .resizable()
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading) {
                Text(coinData.name)
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.primary)
                
                Text(coinData.symbol.uppercased())
                    .font(.caption)
                    .foregroundStyle(.primary)
            }
            .padding(.leading, 7)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(coinData.currentPrice.toCurrency())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.primary)
                
                Text(coinData.priceChangePercentage24H?.percentageToString() ?? "0%")
                    .foregroundStyle(coinData.priceChange24H ?? 0 >= 0 ? .green : .red)
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
    }
}
//
//#Preview() {
//    AllCoinsItem()
//}
