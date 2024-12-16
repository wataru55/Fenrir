//
//  FavoritesView.swift
//  Fenrir
//
//  Created by 高橋和 on 2024/12/17.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationStack{
            LazyVStack {
                Text("appName")
                Spacer()
            } // VStack
        } // NavigationStack
    }
}

#Preview {
    FavoritesView()
}
