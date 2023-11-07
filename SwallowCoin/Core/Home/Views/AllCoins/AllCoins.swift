//
//  AllCoins.swift
//  SwallowCoin
//
//  Created by Mohammad Afshar on 14/10/2023.
//

import SwiftUI

struct AllCoins: View {
    @ObservedObject var coinData: HomeViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("All Coins")
                    .font(.system(size: 24))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 14)
                
                HStack {
                    Text("Coins")
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    
                    Text("Price")
                        .foregroundStyle(.gray)
                }
                
                .padding(.horizontal)
                .padding(.vertical, 10)
                
                VStack {
                    ForEach(coinData.recivedData) { coin in
                        NavigationLink {
                            LazyNavigation(CoinDetailsMainView(coinDetails: CoinDetailViewModel(coin: coin)))
                                .padding(.horizontal)
                        } label: {
                            AllCoinsItem(coinData: coin)
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    AllCoins()
//}
