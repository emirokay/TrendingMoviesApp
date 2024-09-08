//
//  DetailView.swift
//  MoviesApp
//
//  Created by Mustafa Okay on 23.12.2022.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    let movie: Result
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                AsyncImage(url: URL(string: Constants.imageSizew500 + (movie.backdropPath ?? "")), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .overlay{
                            LinearGradient(gradient: Gradient(colors: [
                                .black.opacity(0),
                                .black.opacity(0.02),
                                .black.opacity(0.04),
                                .black.opacity(0.06),
                                .black.opacity(0.4),
                                .black.opacity(0.7)
                            ]), startPoint: .top, endPoint: .bottom)
                        }
        
                } placeholder: {
                    ProgressView()
                }
                
                Text((movie.title ?? movie.name) ?? "unknown")
                    .font(.title).bold()
                    .padding(4)
                    .multilineTextAlignment(.center)
                
				
                Text((movie.releaseDate ?? movie.firstAirDate) ?? "")
                    .font(.caption)
                    .foregroundColor(.secondary)
        
                if favoritesViewModel.movieGenres != nil {
					HStack {
						ForEach(favoritesViewModel.movieGenres!.genres) { genre in
							if movie.genreIds?.contains(genre.id) == true || movie.genres?.contains(genre) == true {
								if genre.name != "" && genre.name.isEmpty == false {
									Text(genre.name)
										.font(.caption)
										.padding(5)
										.background(.secondary.opacity(0.4))
										.clipShape(Capsule())
								}
							}
						}
					}
                }
                
                
                HStack {
                    if movie.adult ?? false {
                        Text("Adult only")
                            .font(.caption)
                            .padding(5)
                            .background(.secondary.opacity(0.4))
                            .clipShape(Capsule())
                    }

                    Text("Language: \(movie.originalLanguage?.uppercased() ?? "Unknown")")
                        .font(.caption)
                        .padding(5)
                        .background(.secondary.opacity(0.4))
                        .clipShape(Capsule())
                    
                    Text("Rating: \(Int(movie.voteAverage ?? 0))/10")
                        .font(.caption)
                        .padding(5)
                        .background(.secondary.opacity(0.4))
                        .clipShape(Capsule())
                }

                
                VStack(alignment: .leading) {
                    Text("Overview")
                        .font(.title2).bold()
                        
                    Text(movie.overview ?? "")
                }.padding()
                
            }
        }
		.background(Color(.secondarySystemBackground))
        .toolbar {
            ToolbarItem {
                Button {
                    favoritesViewModel.saveFavorites(movie: movie)
                } label: {
					Image(systemName: "star.fill")
						.foregroundColor(favoritesViewModel.favorites.keys.contains(movie.id!) ? .yellow : .gray)
                }
            }
        }
		.overlay {
			AddedIndicatorView(show: $favoritesViewModel.isAdded)
		}
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(movie: Result.expResult)
                .preferredColorScheme(.dark)
                .environmentObject(FavoritesViewModel())
        }
    }
}
