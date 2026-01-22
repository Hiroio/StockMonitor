//
//  SecretsDecoder.swift
//  FinanceMonitor
//
//  Created by user on 22.01.2026.
//

import Foundation

enum Secrets{
    static var apiKey: String {
        guard let key = Bundle.main.infoDictionary?["API_KEY"] as? String else {
            fatalError("API_KEY not found")
        }
        return key
    }
}
