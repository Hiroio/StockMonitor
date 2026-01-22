//
//  ApiManager.swift
//  FinanceMonitor
//
//  Created by user on 22.01.2026.
//

import Foundation

class ApiManager {
    
    func getData<T: Decodable>(urlString: String) async throws -> T{
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard response is HTTPURLResponse, (response as! HTTPURLResponse).statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
                
        let result = try JSONManager.getJSONData(data: data) as T
        
        return result
    }
    
    

}
