//
//  MapView.swift
//  Fenrir
//
//  Created by 高橋和 on 2024/12/17.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var mapViewModel: MapViewModel
    
    init() {
        _mapViewModel = StateObject(wrappedValue: MapViewModel(locationManager: LocationManager()))
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                if let mapPosition = mapViewModel.location {
                    Map(position: .constant(mapPosition))
                        .edgesIgnoringSafeArea(.all)
                } else {
                    ProgressView("現在地を取得中...")
                }
            } // VStack
        } // NavigationStack
    }
}

//#Preview {
//    MapView()
//}
