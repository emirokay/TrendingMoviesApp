//
//  Movie.swift
//  MoviesApp
//
//  Created by Mustafa Okay on 22.12.2022.
//

import Foundation

struct Welcome: Codable {
    
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Result: Codable, Identifiable, Equatable {
    
    let adult: Bool?
    let backdropPath: String?
    let id: Int?
    let title, originalLanguage: String?
    let originalTitle, overview, posterPath: String?
    let mediaType: String?
    let genres: [Genre]?
    let genreIds: [Int]?
    let popularity: Double?
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let name, originalName, firstAirDate: String?
    let originCountry: [String]?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genres
        case genreIds = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case name
        case originalName = "original_name"
        case firstAirDate = "first_air_date"
        case originCountry = "origin_country"
    }
    
    static let expResult = Result(adult: false, backdropPath: "/tQ91wWQJ2WRNDXwxuO7GCXX5VPC.jpg", id: 76600, title: "Avatar: The Way of Water", originalLanguage: "en", originalTitle: "Avatar: The Way of Water", overview: "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.", posterPath: "/94xxm5701CzOdJdUEdIuwqZaowx.jpg", mediaType: "movie",genres: [Genre](), genreIds: [878,28,12], popularity: 4334.092, releaseDate: "2022-12-14", video: false, voteAverage: 8.083, voteCount: 903, name: "", originalName: "", firstAirDate: "", originCountry: [""])

}

struct Genres: Codable {
    let genres: [Genre]
}

struct Genre: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
}


struct Genres1: Codable, Identifiable{
    let id: String?
    var name: String?
}

