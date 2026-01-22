//
//  ApiModels.swift
//  FinanceMonitor
//
//  Created by user on 22.01.2026.
//

import Foundation

struct Stock: Codable, Identifiable{
    let id = UUID()
    let tradingSymbol: String
    let registrantName: String
    
    enum CodingKeys: String, CodingKey {
        case tradingSymbol = "trading_symbol"
        case registrantName = "registrant_name"
    }
}


struct StockPricing: Codable, Identifiable{
    let id = UUID()
    let tradingSymbol: String
    let date: Date
    let open: Double
    let high: Double
    let low: Double
    let close: Double
    let volume: Double
    
    enum CodingKeys: String, CodingKey {
        case tradingSymbol = "trading_symbol"
        case date, open, high, low, close, volume
    }
}
