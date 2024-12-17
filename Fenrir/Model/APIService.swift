//
//  APIService.swift
//  Fenrir
//
//  Created by 高橋和 on 2024/12/17.
//

import Foundation

struct APIService {
    static func fetchShop(lat: Double, lng: Double, range: Int) async throws -> [Shop] {
        let apiKey = "24b206804dd6896d"
        let baseURL = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/"
        
        var components = URLComponents(string: baseURL)
        
        components?.queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "lat", value: "\(lat)"),
            URLQueryItem(name: "lng", value: "\(lng)"),
            URLQueryItem(name: "range", value: "\(range)"),
            URLQueryItem(name: "format", value: "json") // JSON形式でレスポンスを取得
        ]
        
        // URLの生成
        guard let url = components?.url else {
            throw URLError(.badURL)
        }
        
        // APIリクエストの送信
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // HTTPステータスコードの確認
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        // JSONデータをコンソールに出力
        if let jsonString = String(data: data, encoding: .utf8) {
            print("取得したJSONデータ:")
            print(jsonString)
        }
        
        // JSONデコード
        do {
            let decodedResponse = try JSONDecoder().decode(ShopResponse.self, from: data)
            return decodedResponse.results.shop // 配列のShopデータを返却
        } catch {
            throw error
        }
    }
}
