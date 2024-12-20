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
                    Map(position: .constant(mapPosition)) {
                        
                        UserAnnotation(anchor: .center)
                        
                        ForEach(mapViewModel.shops) { shop in
                            Marker(coordinate: CLLocationCoordinate2D(latitude: shop.lat, longitude: shop.lng)) {
                                Text(shop.name)
                                Image(systemName: "fork.knife")
                            }
                        }
                    }
                    .mapStyle(.standard(pointsOfInterest: .excludingAll))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .overlay(alignment: .bottom) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(alignment: .bottom) {
                                    ForEach(mapViewModel.shops) { shop in
                                        NavigationLink {
                                            DetailView(shop: shop)
                                        } label: {
                                            ShopCardView(shop: shop)
                                        }
                                    }
                                }
                            }
                            .frame(height: 150)
                        }
                } else {
                    ProgressView("現在地を取得中...")
                }
            } // VStack
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        mapViewModel.updateLocation()
                    } label: {
                        HStack(spacing: 0) {
                            Image(systemName: "mappin.and.ellipse")
                            
                            Text("更新")
                        }
                    }

                }
            }
        } // NavigationStack
    }
}

//#Preview {
//    MapView()
//}
