//
//  DetailView.swift
//  Fenrir
//
//  Created by 高橋和 on 2024/12/19.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: URL(string: "https://imgfp.hotp.jp/IMGH/14/87/P043221487/P043221487_238.jpg")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: UIScreen.main.bounds.width)
                    
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading, spacing: 10) {
                // 店舗名
                Text("串屋八兵衛 八幡駅前店")
                    .font(.system(size: 25))
                    .fontWeight(.heavy)
                    .padding(.leading, 20)
                
                Text("八幡駅前にNew OPEN★ ゆっくり楽しめる店内!")
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
                        HStack {
                            Image(systemName: "fork.knife.circle")
                            
                            Text("和食")
                        }
                        
                        // 料金
                        HStack {
                            Image(systemName: "dollarsign.circle")
                            
                            Text("3,000～3,500円")
                        }
                    }
                    
                    // 住所
                    HStack(alignment: .top) {
                        Image(systemName: "house.circle")
                        
                        VStack(alignment: .leading) {
                            Text("福岡県北九州市八幡東区西本町３-1-1")
                            
                            Text("八幡駅から徒歩3分★")
                                .foregroundStyle(.orange)
                        }
                    }
                    // 営業時間
                    HStack(alignment: .top) {
                        Image(systemName: "gauge.with.needle")
                        
                        Text("月、水～日、祝日、祝前日: 17:00～翌1:00 （料理L.O. 翌0:30 ドリンクL.O. 翌0:30）")
                    }
                }
                .padding(.leading, 20)
                .font(.system(size: 18))
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                .foregroundStyle(.black.opacity(0.7))
                
                // アクセスリンク
                HStack(spacing: 70) {
                    VStack {
                        Image(systemName: "phone")
                            .padding(8)
                            .font(.system(size: 30))
                            .foregroundStyle(.white)
                            .background(
                                Circle()
                                    .foregroundStyle(.black)
                                    .shadow(color: .black.opacity(0.7), radius: 2, x: 3, y: 4)
                            )
                        
                        Text("問い合わせ")
                            .foregroundStyle(.black.opacity(0.7))
                    }
                    
                    VStack(spacing: 8) {
                        Image(systemName: "link")
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

#Preview {
    DetailView()
}
