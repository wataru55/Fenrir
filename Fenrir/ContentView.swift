//
//  ContentView.swift
//  Fenrir
//
//  Created by 高橋和 on 2024/12/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MapView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart")
                }
        }
        .tint(.orange)
    }
}

#Preview {
    ContentView()
}
