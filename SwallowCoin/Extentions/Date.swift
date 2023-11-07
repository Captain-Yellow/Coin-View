//
//  Date.swift
//  SwallowCoin
//
//  Created by Mohammad Afshar on 06/11/2023.
//

import Foundation

extension Date {
    init(coinGecoString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinGecoString) ?? Date()
        
        self.init(timeInterval: 0, since: date)
    }
    
    private var shortDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd"
        return formatter
    }
    
    func asShortDateString() -> String {
        return shortDateFormatter.string(from: self)
    }
}
