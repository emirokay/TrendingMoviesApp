//
//  Constants.swift
//  MoviesApp
//
//  Created by Mustafa Okay on 21.12.2022.
//

import Foundation

struct Constants {
    static let apiKey = "ApiKeyHere"
    static let baseUrl = "https://api.themoviedb.org/3"
    static let trendingExtension = "\(baseUrl)/trending"
    static let exp = "\(trendingExtension)/all/day\(apiKey)"
    
    static let movieGenres = "https://api.themoviedb.org/3/genre/movie/list\(apiKey)"
    static let tvGenres = "https://api.themoviedb.org/3/genre/tv/list\(apiKey)"
    
    static let movieExtension = baseUrl+"/movie"
    static let tvExtension = baseUrl+"/tv"
    
    
    static let imageBaseUrl = "https://image.tmdb.org/t/p"
    static let imageSizeOriginal = "\(imageBaseUrl)/original"
    static let imageSizew500 = "\(imageBaseUrl)/w500"
    static let imageSizew300 = "\(imageBaseUrl)/w300"
    
}
