//
//  HomeView.swift
//  SwallowCoin
//
//  Created by Mohammad Afshar on 13/10/2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel = HomeViewModel()

    var body: some View {
        ZStack {
            GeometryReader { geo in
                NavigationStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        TopMover(coinData: homeViewModel)
                        
                        Divider()
                            .overlay(.gray)
                            .frame(width: geo.size.width - 50, alignment: .center)
                        
                        AllCoins(coinData: homeViewModel)
                    }
                    .navigationTitle("Live Price")
                }
            }
            
            if !homeViewModel.finishLoading {
                LodingIndicator()
            }
        }
        
    }
}

#Preview {
    HomeView()
}
