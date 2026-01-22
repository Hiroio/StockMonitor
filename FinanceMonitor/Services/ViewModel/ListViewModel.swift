//
//  ListViewModel.swift
//  FinanceMonitor
//
//  Created by user on 22.01.2026.
//

import Foundation
import Combine

class ListViewModel: ObservableObject {
    @Published var stocks: [Stock] = []
    @Published var error: String = ""
    @Published var pricingError: String = ""
    @Published var pricingStock: [StockPricing] = []
    
    let apiKey = Secrets.apiKey
    let api = ApiManager()
    init() {
        
    }
    
    func onAppear() async {
        do{
            stocks = try await api.getData(urlString: "https://financialdata.net/api/v1/stock-symbols?key=\(apiKey)")
        }catch{
            self.error = error.localizedDescription
        }
    }
    
    func GetStockPricing(_ id: String) async {
        
        let url = "https://financialdata.net/api/v1/stock-prices?identifier=\(id)&offset=0&key=\(apiKey)"
        do {
            pricingStock = try await api.getData(urlString: url)
            print(pricingStock)
            
        }catch{
            print(error.localizedDescription)
            pricingError = error.localizedDescription
        }
    }
    
}
