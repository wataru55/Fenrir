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
    
    @State private var selectedShopId: String?
    
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
                            Annotation(shop.name ,coordinate: CLLocationCoordinate2D(latitude: shop.lat, longitude: shop.lng)) {
                                Image(systemName: "fork.knife")
                                    .foregroundStyle(.white)
                                    .padding(8)
                                    .background(
                                        Circle()
                                            .foregroundStyle(.orange)
                                            .overlay {
                                                Circle()
                                                    .stroke(lineWidth: 1)
                                                    .foregroundStyle(.black)
                                            }
                                    )
                                    .onTapGesture {
                                        selectedShopId = shop.id
                                    }
                                    .scaleEffect(selectedShopId == shop.id ? 1.5 : 1.0)
                                    .animation(.easeInOut, value: selectedShopId)
                            }
                        }
                    }
                    .mapStyle(.standard(pointsOfInterest: .excludingAll))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(alignment: .bottom) {
                        ScrollViewReader { scrollViewProxy in
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(alignment: .bottom) {
                                    ForEach(mapViewModel.shops) { shop in
                                        NavigationLink {
                                            DetailView(shop: shop)
                                        } label: {
                                            ShopCardView(shop: shop)
                                        }
                                        .id(shop.id)
                                    }
                                }
                            }
                            .frame(height: 150)
                            .onChange(of: selectedShopId) {
                                if let id = selectedShopId {
                                    withAnimation {
                                        scrollViewProxy.scrollTo(id, anchor: .center)
                                    }
                                }
                            }
                        }
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
