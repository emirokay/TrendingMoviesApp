//
//  WebService.swift
//  MoviesApp
//
//  Created by Mustafa Okay on 22.12.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case invalidServerResponse
}

class WebService: NetworkService {
    
    func downloadTrendings(_ resource: String) async throws -> Welcome {
        guard let url = URL(string: resource) else { throw NetworkError.invalidUrl }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        guard let asd = try? JSONDecoder().decode(Welcome.self, from: data) else {
            return Welcome(page: 1, results: [Result](), totalPages: 2, totalResults: 1)
        }
        return asd
    }
    
    func downloadGenres(_ resource: String) async throws -> Genres {
        guard let url = URL(string: resource) else { throw NetworkError.invalidUrl }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        guard let genres = try? JSONDecoder().decode(Genres.self, from: data) else {
            return Genres(genres: [Genre]())
        }
        
        return genres
    }
    
    func downloadMovie(_ resource: String) async throws -> Result {
        guard let url = URL(string: resource) else { throw NetworkError.invalidUrl }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }

        guard let movie = try? JSONDecoder().decode(Result.self, from: data) else {
            return Result.expResult
        }
        return movie
    }
    
}
