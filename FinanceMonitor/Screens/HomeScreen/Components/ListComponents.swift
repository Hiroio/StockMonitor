//
//  ListComponents.swift
//  FinanceMonitor
//
//  Created by user on 22.01.2026.
//

import SwiftUI

struct ListComponents: View {
    let data: [Stock]
    let onSelect: (String) async -> Void
    var body: some View {
        VStack{
            List(data){item in
                NavigationLink {
                    StockPricingView(stock: item)
                        .onAppear() {
                            Task{
                                await onSelect(item.tradingSymbol)
                            }
                        }
                } label: {
                    HStack(){
                        VStack(alignment: .leading){
                            Text(item.tradingSymbol)
                                .font(.title3)
                            Text(item.registrantName)
                                .font(.caption)
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    ListComponents(data: [Stock(tradingSymbol: "AMPY", registrantName: "Amplify Energy Corp.")], onSelect: {string in})
}
