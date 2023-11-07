//
//  ChartView.swift
//  SwallowCoin
//
//  Created by Mohammad Afshar on 06/11/2023.
//

import SwiftUI
import Charts

struct ChartView: View {
    let chichi: CoinDetailViewModel
    
    var body: some View {
        Chart {
            ForEach(chichi.chartData) { item in
                LineMark(x: .value("Data", item.date),
                         y: .value("Price", item.value))
                .interpolationMethod(.cardinal)
            }
        }
        .chartXScale(domain: ClosedRange(uncheckedBounds: (lower: chichi.startDate,
                                                          upper: chichi.endDate)))
        .chartXAxis {
            AxisMarks(position: .bottom, values: chichi.xAxis) { value in
                AxisGridLine()
                AxisValueLabel {
                    if let dateValue = value.as(Date.self) {
                        Text(dateValue.asShortDateString())
                    }
                }
            }
        }
        
        .chartYScale(domain: ClosedRange(uncheckedBounds: (lower: chichi.minPrice,
                                                           upper: chichi.maxPrice)))
        .chartYAxis {
            AxisMarks(position: .leading, values: chichi.yAxis) { value in
                AxisGridLine()
                AxisValueLabel {
                    if let doubleValue = value.as(Double.self) {
                        Text(doubleValue.formattedWithAbbreviations())
                    }
                }
            }
        }
    }
}

//#Preview {
//    ChartView()
//}
