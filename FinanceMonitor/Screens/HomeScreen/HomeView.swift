//
//  HomeView.swift
//  FinanceMonitor
//
//  Created by user on 22.01.2026.
//

import SwiftUI

struct HomeView: View {
    @StateObject var listVM: ListViewModel = .init()
    var body: some View {
        NavigationStack{
            VStack{
                Text("All available Stocks")
                    .font(.title)
                if listVM.stocks.isEmpty {
                    LoadingComponent()
                }else{
                    ListComponents(data: listVM.stocks, onSelect: {string in await listVM.GetStockPricing(string)})
                }
                
            }
        }
        .environmentObject(listVM)
        .task {
            await listVM.onAppear()
        }
    }
}

#Preview {
    HomeView()
}
