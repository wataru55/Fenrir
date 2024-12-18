//
//  Shop.swift
//  Fenrir
//
//  Created by 高橋和 on 2024/12/17.
//

import Foundation

struct Shop: Codable, Identifiable {
    let id: String
    let name: String
    let logoImage: String
    let address: String
    let lat: Double
    let lng: Double
    let mobileAccess: String
    let open: String
    let close: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case logoImage = "logo_image"
        case address
        case lat
        case lng
        case mobileAccess = "mobile_access"
        case open
        case close
    }
}
