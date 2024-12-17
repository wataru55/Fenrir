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
    private var cancellable: AnyCancellable?
    
    private let locationManager: LocationManager // 位置情報マネージャ
    
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
        setUpSubscriber()
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
