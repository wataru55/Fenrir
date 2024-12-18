//
//  ShopCardView.swift
//  Fenrir
//
//  Created by 高橋和 on 2024/12/17.
//

import SwiftUI

struct ShopCardView: View {
    let shop: Shop
    
    var body: some View {
        HStack(spacing: 0) {
            AsyncImage(url: URL(string: shop.logoImage)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding()
                
            } placeholder: {
                ProgressView()
                    .background(
                        Rectangle()
                            .frame(width: 100, height: 100)
                            .foregroundStyle(.gray)
                    )
            }
            
            Rectangle()
                .frame(width: 1, height: 100)
                .foregroundStyle(.gray)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(shop.name)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .padding(.bottom, 10)
                
                Text(shop.mobileAccess)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width, height: 150)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .padding()
                .foregroundStyle(.white)
                .shadow(color: .black.opacity(0.5), radius: 2, x: 2, y: 2)
        )
    }
}

#Preview {
    ShopCardView(shop: Shop(id: "1", name: "白木屋", logoImage: "a", address: "折尾駅周辺", lat: 33.3, lng: 180.564, mobileAccess: "折尾駅から徒歩２分", open: "16:00~", close: "~23:00"))
}
