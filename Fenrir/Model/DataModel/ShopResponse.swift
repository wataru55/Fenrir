//
//  ShopResponse.swift
//  Fenrir
//
//  Created by 高橋和 on 2024/12/17.
//

import Foundation

struct ShopResponse: Codable {
    let results: Results
    
    struct Results: Codable {
        let apiVersion: String
        let resultsAvailable: Int
        let resultsReturned: String
        let resultsStart: Int
        let shop: [Shop]
        
        private enum CodingKeys: String, CodingKey {
            case apiVersion = "api_version"
            case resultsAvailable = "results_available"
            case resultsReturned = "results_returned"
            case resultsStart = "results_start"
            case shop
        }
    }
    
}
