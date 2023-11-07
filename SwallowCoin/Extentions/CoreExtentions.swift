//
//  CoreExtentions.swift
//  SwallowCoin
//
//  Created by Mohammad Afshar on 28/10/2023.
//

import Foundation

extension Double {
    private var currancyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 3
        formatter.maximumFractionDigits = 3
        return formatter
    }
    
    private var percentageFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 3
        formatter.maximumFractionDigits = 3
        return formatter
    }
    
    func toCurrency() -> String {
        let formatter = currancyFormatter
        return formatter.string(for: self) ?? "$0.000"
    }
    
    func percentageToString() -> String {
        let formatter = percentageFormatter
        guard let str = formatter.string(for: self) else { return "0%"}
        return str + "%"
    }
    
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""
        
        switch num {
            case 1_000_000_000_000...:
                let formatted = num / 1_000_000_000_000
                let stringFormated = formatted.asNumberString()
                return "\(sign)\(stringFormated) Tr"
            case 1_000_000_000...:
                let formatted = num / 1_000_000_000
                let stringFormated = formatted.asNumberString()
                return "\(sign)\(stringFormated) Bn"
            case 1_000_000...:
                let formatted = num / 1_000_000
                let stringFormated = formatted.asNumberString()
                return "\(sign)\(stringFormated) M"
            case 1_000...:
                let formatted = num / 1_000
                let stringFormated = formatted.asNumberString()
                return "\(sign)\(stringFormated) K"
            default:
                return "\(sign)\(self.asNumberString())"
        }
    }
}

