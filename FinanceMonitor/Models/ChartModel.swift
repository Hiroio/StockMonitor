//
//  ChartModel.swift
//  FinanceMonitor
//
//  Created by user on 22.01.2026.
//

import Foundation


struct ChartModel: Identifiable {
    let id = UUID()
    let name: String
    let date: Date
    let open: Double
    let high: Double
    let low: Double
    let close: Double
}


extension ChartModel{
    init(_ entity: StockPricing){
        self.name = entity.tradingSymbol
        self.date = entity.date
        self.open = entity.open
        self.high = entity.high
        self.low = entity.low
        self.close = entity.close
    }
}
