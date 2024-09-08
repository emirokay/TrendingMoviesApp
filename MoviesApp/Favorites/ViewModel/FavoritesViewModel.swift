//
//  FavoritesViewModel.swift
//  MoviesApp
//
//  Created by Mustafa Okay on 25.12.2022.
//

import SwiftUI

class FavoritesViewModel: ObservableObject {
    let service = WebService()
    @Published var rows = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
	@Published var isAdded = false
    @Published var favoriteMovies = [Result]()
    @Published var favorites = [Int: String]()
    @Published var movieGenres: Genres?
    
    init() {
        loadFavorites()
        Task {
            await downloadGenres()
        }
    }
    
    func downloadFavoriteMovies() async {
        for favorite in favorites {
            
            if favorite.value == "movie" {
                let movie = try? await service.downloadMovie(Constants.movieExtension+"/\(favorite.key)"+Constants.apiKey)
                if let movie = movie {
                    await MainActor.run {
                        self.favoriteMovies.append(movie)
                    }
                }
            } else if favorite.value == "tv" {
                let tv = try? await service.downloadMovie(Constants.tvExtension+"/\(favorite.key)"+Constants.apiKey)
                if let tv = tv {
                    await MainActor.run {
                        self.favoriteMovies.append(tv)
                    }
                }
            }
            
        }
    }
    
    func loadFavorites() {
        if let data = UserDefaults.standard.data(forKey: "FavoritesDictionary") {
            if let decoded = try? JSONDecoder().decode([Int: String].self, from: data) {
                favorites = decoded
            }
        }
        self.favoriteMovies.removeAll()
        Task {
            await downloadFavoriteMovies()
        }
    }
    
    func saveFavorites(movie: Result) {
		self.isAdded = true
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			self.isAdded = false
		}

        if favorites.keys.contains(movie.id!) {
            favorites.removeValue(forKey: movie.id!)
            
            if let index = favoriteMovies.firstIndex(of: movie) {
                favoriteMovies.remove(at: index)
            }
        } else {
            favorites.updateValue(movie.mediaType!, forKey: movie.id!)
        }
        if let data = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(data, forKey: "FavoritesDictionary")
        }
        loadFavorites()
    }
    
    func downloadGenres() async {
        let movieGenres = Constants.movieGenres
        let tvGenres = Constants.tvGenres
        
        let data = try? await service.downloadGenres(movieGenres)
        let data2 = try? await service.downloadGenres(tvGenres)
        guard let movieGenres = data else { return }
        guard let tvGenres = data2 else { return }
        
        let combinedGenres = movieGenres.genres + tvGenres.genres
        
		var uniqueGenresDict = [Int: Genre]()
			combinedGenres.forEach { genre in
				uniqueGenresDict[genre.id] = genre
			}
		
		let uniqueGenres = Array(uniqueGenresDict.values)
		
        await MainActor.run {
            self.movieGenres = Genres(genres: uniqueGenres)
        }
    }
    
}
