//
//  CoinDetailsModel.swift
//  SwallowCoin
//
//  Created by Mohammad Afshar on 31/10/2023.
//

import Foundation

struct CoinDetailsModel: Identifiable {
    var id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
}
