//
//  ChartData.swift
//  SwallowCoin
//
//  Created by Mohammad Afshar on 06/11/2023.
//

import Foundation

struct ChartData: Identifiable {
    let id = UUID().uuidString
    let date: Date
    let value: Double
}
