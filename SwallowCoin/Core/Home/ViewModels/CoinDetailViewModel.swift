//
//  CoinDetailViewModel.swift
//  SwallowCoin
//
//  Created by Mohammad Afshar on 06/11/2023.
//

import SwiftUI

struct CoinDetailViewModel {
    private let coin: CoinDataModel
    var chartData = [ChartData]()
    var startDate = Date()
    var endDate = Date()
    var minPrice = 0.0
    var maxPrice = 0.0
    var xAxis = [Date]()
    var yAxis = [Double]()
    
    init(coin: CoinDataModel) {
        self.coin = coin
        configChart()
    }
    
    var overvieSectionModel: CoinDetailsModelArray {
        // price stats
        let price = coin.currentPrice.toCurrency()
        let pricePercentage = coin.priceChangePercentage24H
        let priceStats = CoinDetailsModel(title: "Current Price", value: price, percentageChange: pricePercentage)
        
        // market cap stats
        let marketCap = coin.marketCap ?? 0
        let marketCapPercentage = coin.marketCapChangePercentage24H
        let marketCapStats = CoinDetailsModel(title: "Market Capitalization", value: "\(marketCap.formattedWithAbbreviations())", percentageChange: marketCapPercentage)
        
        // rank stats
        let rank = coin.marketCapRank
        let rankStats = CoinDetailsModel(title: "Rank", value: "\(rank ?? 0)", percentageChange: nil)
        
        // volume stats
        let valume = coin.totalVolume ?? 0
        let valumeStats = CoinDetailsModel(title: "Volume", value: "\(valume.formattedWithAbbreviations())", percentageChange: nil)
        
        return CoinDetailsModelArray(title: "Overview", detailArray: [priceStats, marketCapStats, rankStats, valumeStats])
    }
    
    var additionalDetailModel: CoinDetailsModelArray {
        // 24H high
        let high = coin.high24H?.toCurrency() ?? "n/a"
        let highStat = CoinDetailsModel(title: "24H High", value: high, percentageChange: nil)
        
        // 24H Low
        let low = coin.low24H?.toCurrency() ?? "n/a"
        let lowStat = CoinDetailsModel(title: "24H low", value: low, percentageChange: nil)
        
        // 24H Price change
        let priceChange24H = coin.priceChange24H?.toCurrency()
        let percentChange24H = coin.priceChangePercentage24H
        let priceChangeStat = CoinDetailsModel(title: "24H Price Change", value: priceChange24H ?? "0", percentageChange: percentChange24H)
        
        // 24H market cap change
        let marketCapChange = coin.marketCapChange24H ?? 0
        let marketCapChangePercent = coin.marketCapChangePercentage24H
        let marketStat = CoinDetailsModel(title: "24H Market Cap Change", value: "$\(marketCapChange.formattedWithAbbreviations())", percentageChange: marketCapChangePercent)
        
        return CoinDetailsModelArray(title: "Additional Details", detailArray: [highStat, lowStat, priceChangeStat, marketStat])
    }
    
    private mutating func configChart() {
        guard let priceDate = coin.sparklineIn7D?.price else { return }
        var index = 0.0
        self.minPrice = priceDate.min() ?? 0.0
        self.maxPrice = priceDate.max() ?? 0.0
        self.endDate = Date(coinGecoString: coin.lastUpdated ?? "")
        self.startDate = endDate.addingTimeInterval(-7 * 60 * 60 * 24)
        self.xAxis = [startDate, endDate]
        self.yAxis = [minPrice, (minPrice + maxPrice) / 2, maxPrice]
        
        for prices in priceDate.reversed() {
            let date = self.endDate.addingTimeInterval(-1 * 60 * 60 * Double(index))
            
            let chartDataItem = ChartData(date: date, value: prices)
            self.chartData.append(chartDataItem)
            index += 1
        }
    }
    
    var chartColor: Color {
        let priceChange = (coin.sparklineIn7D?.price.last ?? 0) - (coin.sparklineIn7D?.price.first ?? 0)
        return priceChange > 0 ? .green : .red
    }
    
    var coinName: String {
        coin.name
    }
    
}
