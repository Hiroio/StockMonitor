//
//  ChartViewModel.swift
//  FinanceMonitor
//
//  Created by user on 22.01.2026.
//

import Foundation
import Combine


class ChartViewModel: ObservableObject {
    @Published var selectedPeriod: ChartSelectionHeader = .week
    
    func selectedPeriod(data: [StockPricing]) -> [ChartModel] {
        switch selectedPeriod {
        case .week:
            return filterForWeek(data: data)
        case .month:
            return filterForMonth(data: data)
        case .threeMonths:
            return filterForThreeMonth(data: data)
        case .sixMonths:
            return filterForSixMonth(data: data)
        case .year:
            return filterForYear(data: data)
        }
    }
    
    
    private func filterForWeek(data: [StockPricing]) -> [ChartModel]{
        let sortedData = data.sorted(by: {$0.date > $1.date})
        
        return sortedData.prefix(7).map{ChartModel($0)}
    }
    private func filterForMonth(data: [StockPricing]) -> [ChartModel]{
        let sortedData = data.sorted(by: {$0.date > $1.date})
        
        return sortedData.prefix(30).map{ChartModel($0)}
    }
    private func filterForThreeMonth(data: [StockPricing]) -> [ChartModel]{
        let sortedData = data.sorted(by: {$0.date > $1.date})
        
        return sortedData.prefix(30*3).map{ChartModel($0)}
    }
    private func filterForSixMonth(data: [StockPricing]) -> [ChartModel]{
        let sortedData = data.sorted(by: {$0.date > $1.date})
        
        return sortedData.prefix(30*6).map{ChartModel($0)}
    }
    private func filterForYear(data: [StockPricing]) -> [ChartModel]{
        let sortedData = data.sorted(by: {$0.date > $1.date})
        
        return sortedData.prefix(30*12).map{ChartModel($0)}
    }
}
