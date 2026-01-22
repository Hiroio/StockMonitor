//
//  ChartSelection.swift
//  FinanceMonitor
//
//  Created by user on 22.01.2026.
//

import SwiftUI

struct ChartSelection: View {
    @StateObject var vm = ChartViewModel()
    let data: [StockPricing]
    var body: some View {
        VStack{
//        MARK: -     ---------------Selector-------------
            HStack{
                ForEach(ChartSelectionHeader.allCases){item in
                    Button{vm.selectedPeriod = item}label:{
                        Text(item.rawValue)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(vm.selectedPeriod == item ? Color.secondary : Color.clear)
                            )
                    }
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.secondary)
            )
            .padding(.horizontal)
//            MARK: -
            
            ChartComponent(data: vm.selectedPeriod(data: data))
        }
    }
}

#Preview {
    ChartSelection(data: [])
}
