//
//  File.swift
//  FinanceMonitor
//
//  Created by user on 22.01.2026.
//

import Foundation


enum ChartSelectionHeader: String, CaseIterable, Identifiable{
    case week = "W", month = "M", threeMonths = "3M", sixMonths = "6M", year = "1Y"
    
    var id: String{
        self.rawValue
    }
}
