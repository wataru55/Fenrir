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
        let shop: [Shop]
    }
}
