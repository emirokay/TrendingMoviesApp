//
//  ContentView.swift
//  MoviesApp
//
//  Created by Mustafa Okay on 21.12.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var trendingViewModel = TrendingViewModel()
    @StateObject var favoritesViewModel = FavoritesViewModel()

    var body: some View {
        TabView{
            TrendingView()
                .tabItem {
                    Label("Trendings", systemImage: "text.badge.star")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }
        }
		.overlay{
			LoadingView(show: $trendingViewModel.isLoading)
		}
        .environmentObject(trendingViewModel)
        .environmentObject(favoritesViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
