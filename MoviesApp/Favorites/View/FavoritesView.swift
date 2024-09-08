//
//  FavoritesView.swift
//  MoviesApp
//
//  Created by Mustafa Okay on 25.12.2022.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
        
    var body: some View {
        NavigationView {
            ScrollView {
				Text("Favorites")
					.font(.largeTitle).bold()
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.horizontal)
				LazyVGrid(columns: favoritesViewModel.rows) {
                    ForEach(favoritesViewModel.favoriteMovies) { favorite in
                        NavigationLink {
                            DetailView(movie: favorite)
                        } label: {
                            AsyncImage(url: URL(string: Constants.imageSizew500 + (favorite.posterPath ?? "")), scale: 3) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: UIScreen.main.bounds.width / 2)
                                    .cornerRadius(7)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
					.padding(3)
                }
                .padding([.horizontal, .bottom])
            }
			.background(Color(.secondarySystemBackground))
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(FavoritesViewModel())
    }
}
