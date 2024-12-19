//
//  MapViewModel.swift
//  Fenrir
//
//  Created by 高橋和 on 2024/12/17.
//

import SwiftUI
import MapKit
import Combine

class MapViewModel: ObservableObject {
    @Published var location: MapCameraPosition?
    @Published var shops: [Shop] = []
    @Published var message: String = "現在地を取得中..."
    private var cancellable: AnyCancellable?
    
    private let locationManager: LocationManager // 位置情報マネージャ
    
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
        Task {
            await loadShop(range: 2)
        }
        setUpSubscriber()
    }
    
    @MainActor
    func loadShop(range: Int, retryCount: Int = 3) async {
        guard let latitude = location?.region?.center.latitude,
              let longitude = location?.region?.center.longitude else {
            if retryCount > 0 {
                print("位置情報が取得できませんでした。あと\(retryCount)回リトライします...")
                try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
                await loadShop(range: range, retryCount: retryCount - 1)
            } else {
                message = "位置情報が取得できませんでした"
            }
            return
        }
        
        do {
            shops = try await APIService.fetchShop(lat: latitude, lng: longitude, range: range)
            print("\(shops.count)件の店舗を取得しました")
        } catch {
            print("エラー: \(error)")
        }
    }
    
    private func setUpSubscriber() {
        self.cancellable = locationManager.$location
            .compactMap { $0 } // nilを除外
            .map { location in
                MapCameraPosition.region(MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude),
                    latitudinalMeters: 100.0,
                    longitudinalMeters: 100.0
                ))
            }
            .assign(to: \.location, on: self)
    }
}
