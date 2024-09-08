//
//  NetworkService.swift
//  MoviesApp
//
//  Created by Mustafa Okay on 22.12.2022.
//

import Foundation

protocol NetworkService {
    func downloadTrendings(_ resource: String) async throws -> Welcome
    func downloadGenres(_ resource: String) async throws -> Genres
    func downloadMovie(_ resource: String) async throws -> Result
}
