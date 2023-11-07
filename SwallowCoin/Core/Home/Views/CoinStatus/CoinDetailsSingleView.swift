//
//  CoinDetailsView.swift
//  SwallowCoin
//
//  Created by Mohammad Afshar on 28/10/2023.
//

import SwiftUI

struct CoinDetailsSingleView: View {
    internal let sectionModel: CoinDetailsModelArray
    internal var gridColumns:GridItem = GridItem(.flexible())
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(sectionModel.title)
                .font(.title)
                .fontWeight(.bold)
            
            LazyVGrid(columns: [gridColumns, gridColumns], alignment: .leading, spacing: 24) {
                ForEach(sectionModel.detailArray) { stat in
                    CoinDetailsItem(model: stat)
                }
            }
        }
    }
}

#Preview {
    CoinDetailsSingleView(sectionModel: DeveloperPreview.instance.statArray)
}
