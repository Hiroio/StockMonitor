//
//  JSONManager.swift
//  FinanceMonitor
//
//  Created by user on 22.01.2026.
//

import Foundation


class JSONManager {
    
    static func getJSONData<T: Decodable>(data: Data) throws -> T{
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        decoder.dateDecodingStrategy = .formatted(formatter)
        let data = try decoder.decode(T.self, from: data)
        
        return data
    }
}
