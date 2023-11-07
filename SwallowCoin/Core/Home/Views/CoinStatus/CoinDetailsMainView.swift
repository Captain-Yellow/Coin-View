//
//  CoinDetailsMainView.swift
//  SwallowCoin
//
//  Created by Mohammad Afshar on 04/11/2023.
//

import SwiftUI

struct CoinDetailsMainView: View {
    let coinDetails: CoinDetailViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ChartView(chichi: coinDetails)
                    .frame(height: 250)
                    .padding(.vertical)
                    .foregroundStyle(coinDetails.chartColor)
                    .shadow(color: coinDetails.chartColor, radius: 10)
                    .shadow(color: coinDetails.chartColor.opacity(10), radius: 10)
                
                CoinDetailsSingleView(sectionModel: coinDetails.overvieSectionModel)
                    .padding(.vertical)
                
                CoinDetailsSingleView(sectionModel: coinDetails.additionalDetailModel)
                    .padding(.vertical)
            }
            .navigationTitle(coinDetails.coinName)
        }
    }
}

//#Preview {
//    CoinDetailsMainView()
//}
