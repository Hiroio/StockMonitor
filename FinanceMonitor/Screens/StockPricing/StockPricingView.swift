//
//  StockPricingView.swift
//  FinanceMonitor
//
//  Created by user on 22.01.2026.
//

import SwiftUI

struct StockPricingView: View {
    @EnvironmentObject var vm: ListViewModel
    let stock: Stock
    var body: some View {
        VStack{
            Text(stock.registrantName)
                .multilineTextAlignment(.center)
                .font(.headline)
            if vm.pricingStock.isEmpty{
                Spacer()
                LoadingComponent()
            }else{
                CurrentDatePricing(pricing: vm.pricingStock.first ?? StockPricing(tradingSymbol: "Failed", date: Date(), open: 0, high: 0, low: 0, close: 0, volume: 0) )
                
                Spacer()
                
                //            TODO: some sort of chart + options for chart
                ChartSelection(data: vm.pricingStock)
                
                Spacer()
            }
            
        }
        .navigationTitle(stock.tradingSymbol)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    StockPricingView(stock: Stock(tradingSymbol: "APLE", registrantName: "Apple Hospitality REIT, Inc."))
        .environmentObject(ListViewModel())
}
