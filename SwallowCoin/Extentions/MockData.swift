//
//  MockData.swift
//  SwallowCoin
//
//  Created by Mohammad Afshar on 04/11/2023.
//

import Foundation

class DeveloperPreview {
    static let instance = DeveloperPreview()
    
    let stat1 = CoinDetailsModel(title: "Current Price",
                                 value: "$21, 543.00", percentageChange: 1.23)
    
    let stat2 = CoinDetailsModel(title: "Market Capitalization",
                                 value: "$413.15Bn", percentageChange: 1.67)
    
    let stat3 = CoinDetailsModel(title: "Rank",
                                 value: "1", percentageChange: nil)
    
    let stat4 = CoinDetailsModel(title: "Volume",
                                 value: "35.99Bn", 
                                 percentageChange: nil)
    
    lazy var statArray: CoinDetailsModelArray = CoinDetailsModelArray(title: "Ok", detailArray: [stat1, stat2, stat3, stat4])
    

}
