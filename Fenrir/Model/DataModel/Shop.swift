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
    let genre: Genre
    let budget: Budget
    let catchWord: String
    let mobileAccess: String
    let urls: URLs
    let photo: Photo
    let open: String
    let couponUrls: CouponUrls
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case logoImage = "logo_image"
        case address
        case lat
        case lng
        case genre
        case budget
        case catchWord = "catch"
        case mobileAccess = "mobile_access"
        case urls
        case photo
        case open
        case couponUrls = "coupon_urls"
    }
    
    struct Genre: Codable {
        let name: String
        let catchWord: String
        let code: String
        
        private enum CodingKeys: String, CodingKey {
            case name
            case catchWord = "catch"
            case code
            
        }
    }
    
    struct Budget: Codable {
        let code: String
        let name: String
        let average: String
    }
    
    struct URLs: Codable {
        let pc: String
    }
    
    struct Photo: Codable {
        let pc: PC
        let mobile: Mobile
        
        struct PC: Codable {
            let l: String
            let m: String
            let s: String
        }
        
        struct Mobile: Codable {
            let l: String
            let s: String
        }
    }
    
    struct CouponUrls: Codable {
        let pc: String
        let sp: String
    }
}
