//
//  LocationManager.swift
//  Fenrir
//
//  Created by 高橋和 on 2024/12/17.
//

import CoreLocation
import SwiftUI

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    @Published var location: CLLocation? = nil

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            self.location = location
        }
    }
}
