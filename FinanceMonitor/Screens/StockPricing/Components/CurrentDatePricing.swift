//
//  CurrentDatePricing.swift
//  FinanceMonitor
//
//  Created by user on 22.01.2026.
//

import SwiftUI

struct CurrentDatePricing: View {
    let pricing: StockPricing
    var body: some View {
        VStack(spacing: 10){
            Text(pricing.tradingSymbol)
                .font(.title2.bold())
            Text(pricing.date.formatted(.dateTime.day().month().year()))
                .font(.headline)
            HStack(spacing: 25){
                VStack(spacing: 10){
                    HStack{
                        Image(systemName: "arrow.right.circle")
                            .foregroundStyle(.yellow)
                        Text(pricing.open.formatted(.number.precision(.fractionLength(2))))
                    }
                    
                    HStack{
                        Image(systemName: "arrow.down.circle.fill")
                            .foregroundStyle(.red)
                        Text(pricing.low.formatted(.number.precision(.fractionLength(2))))
                    }

                }
                
                VStack(spacing: 10){
                    HStack{
                        Image(systemName: "arrow.up.circle.fill")
                            .foregroundStyle(.green)
                        Text(pricing.high.formatted(.number.precision(.fractionLength(2))))
                    }
                    HStack{
                        Image(systemName: "stop.circle")
                            .foregroundStyle(.red)
                        Text(pricing.close.formatted(.number.precision(.fractionLength(2))))
                    }

                }
            }
            .font(.title3)
            HStack{
                Image(systemName: "chart.xyaxis.line")
                Text("Volume: \(pricing.volume.formatted(.number.precision(.fractionLength(0))))")
            }.font(.title3)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(radius: 5)
        )
    }
}

#Preview {
    CurrentDatePricing(pricing: StockPricing(tradingSymbol: "AAPL", date: Date(), open: 12.5545345, high: 12.7, low: 12.2, close: 12.44343, volume: 2435964.0))
}
