//
//  TopMover.swift
//  SwallowCoin
//
//  Created by Mohammad Afshar on 13/10/2023.
//

import SwiftUI

struct TopMover: View {
    @StateObject var coinData: HomeViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    ForEach(coinData.topCoin) { coin in
                        NavigationLink {
                            LazyNavigation(CoinDetailsMainView(coinDetails: CoinDetailViewModel(coin: coin)))
                                .padding(.horizontal)
                        } label: {
                            TopMoverItem(coin: coin)
                        }
                    }
                }
                .padding(5)
            }
        }
    }
}
//
//#Preview {
//    TopMover()
//}
