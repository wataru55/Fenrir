//
//  DetailView.swift
//  Fenrir
//
//  Created by 高橋和 on 2024/12/19.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.openURL) var openURL
    
    let shop: Shop
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center) {
                AsyncImage(url: URL(string: shop.logoImage)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: UIScreen.main.bounds.width)
                        
                } placeholder: {
                    ProgressView()
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    // 店舗名
                    Text(shop.name)
                        .font(.system(size: 25))
                        .fontWeight(.heavy)
                        .padding(.leading, 20)
                    
                    Text(shop.genre.catchWord)
                        .padding(.leading, 20)
                        .font(.system(size: 18))
                        .foregroundStyle(.orange)
                    
                    Divider()
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                    
                    VStack(alignment: .leading, spacing: 30) {
                        // ジャンルと料金
                        HStack {
                            // ジャンル
                            HStack(alignment: .top) {
                                Image(systemName: "fork.knife.circle")
                                
                                Text(shop.genre.name)
                            }
                            
                            // 料金
                            HStack {
                                Image(systemName: "dollarsign.circle")
                                
                                Text(shop.budget.name)
                            }
                        }
                        
                        // 住所
                        HStack(alignment: .top) {
                            Image(systemName: "house.circle")
                            
                            VStack(alignment: .leading) {
                                Text(shop.address)
                                
                                Text(shop.mobileAccess)
                                    .foregroundStyle(.orange)
                            }
                        }
                        // 営業時間
                        HStack(alignment: .top) {
                            Image(systemName: "gauge.with.needle")
                            
                            Text(shop.open)
                        }
                    }
                    .padding(.leading, 20)
                    .font(.system(size: 18))
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .foregroundStyle(.black.opacity(0.7))
                    
                    // アクセスリンク
                    HStack(spacing: 60) {
                        Button {
                            openURL(URL(string: shop.urls.pc)!)
                        } label: {
                            VStack(spacing: 8) {
                                Image(systemName: "globe")
                                    .padding(8)
                                    .font(.system(size: 28))
                                    .foregroundStyle(.white)
                                    .background(
                                        Circle()
                                            .foregroundStyle(.black)
                                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                                    )
                                
                                Text("URL")
                                    .foregroundStyle(.black.opacity(0.7))
                            }
                        }
                        
                        Button {
                            openURL(URL(string: shop.couponUrls.sp)!)
                        } label: {
                            VStack {
                                Image(systemName: "rectangle.portrait.on.rectangle.portrait.angled")
                                    .padding(8)
                                    .font(.system(size: 25))
                                    .foregroundStyle(.white)
                                    .background(
                                        Circle()
                                            .foregroundStyle(.black)
                                            .shadow(color: .black.opacity(0.7), radius: 2, x: 3, y: 4)
                                    )
                                
                                Text("クーポン")
                                    .foregroundStyle(.black.opacity(0.7))
                            }
                        }

                    }
                    .frame(width: UIScreen.main.bounds.width, alignment: .center)
                    .padding(.top, 20)
                    
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                .padding(.horizontal, 10)
                .padding(.top, 10)
                
                Spacer()
                
            }
            .ignoresSafeArea(.all)
        }
    }
}

//#Preview {
//    DetailView()
//}
