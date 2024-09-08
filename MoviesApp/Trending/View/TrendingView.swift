//
//  TrendingView.swift
//  MoviesApp
//
//  Created by Mustafa Okay on 22.12.2022.
//

import SwiftUI

struct TrendingView: View {
    @EnvironmentObject var trendingViewModel: TrendingViewModel
    
    var body: some View {
        NavigationView {
			ScrollView (showsIndicators: false){
                VStack {
					if let welcome = trendingViewModel.welcome?.results.randomElement() {
						NavigationLink{
							DetailView(movie: welcome)
						} label: {
							AsyncImage(url: URL(string: Constants.imageSizew500 + (welcome.posterPath ?? "")), scale: 3) { image in
								image
									.resizable()
									.frame(height: UIScreen.main.bounds.height * 0.60, alignment: .centerLastTextBaseline)
									.scaledToFit()
									.overlay(
										LinearGradient(gradient: Gradient(colors: [
											.black.opacity(0),
											.black.opacity(0.02),
											.black.opacity(0.04),
											.black.opacity(0.06),
											.black.opacity(0.4),
											.black.opacity(0.7)
										]), startPoint: .top, endPoint: .bottom)
										)
							} placeholder: {
								ProgressView()
							}
						}
                    }
                    
                    if trendingViewModel.welcome != nil {
                        Text("Trending Movies")
                            .font(.title).bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                        SideScrollView(resultArr: trendingViewModel.movies)
                        
                        Text("Trending TV Shows")
                            .font(.title).bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                        SideScrollView(resultArr: trendingViewModel.tv)
                    }
                }
			}
            .ignoresSafeArea()
			.padding(.bottom, 1)
			.background(Color(.secondarySystemBackground))
        }
		
        
    }
}

struct TrendingView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingView()
            .environmentObject(TrendingViewModel())
    }
}
