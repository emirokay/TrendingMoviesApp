//
//  ViewModel.swift
//  MoviesApp
//
//  Created by Mustafa Okay on 22.12.2022.
//

import CoreData
import Foundation

enum mediaType: String {
    case movie = "movie"
    case tv = "tv"
    case all = "all"
}

enum timeWindow: String {
    case day = "day"
    case week = "week"
}

class TrendingViewModel: ObservableObject {
    @Published var welcome: Welcome?
    @Published var movies = [Result]()
    @Published var tv = [Result]()
	@Published var isLoading = false
    let service = WebService()
    
    init() {
        Task {
            await downloadTrendings(type: .all, time: .day)
        }
    }
    
    func downloadTrendings(type: mediaType, time: timeWindow) async {
		self.isLoading = true
        let urlString = "\(Constants.trendingExtension)/\(type)/\(time)\(Constants.apiKey)"

        let data = try? await service.downloadTrendings(urlString)
        guard let results = data else { return }
        
        for result in results.results {
            if result.mediaType?.isEmpty == false && result.mediaType == "movie" {
                await MainActor.run {
                    self.movies.append(result)
                }
            } else if result.mediaType?.isEmpty == false && result.mediaType == "tv" {
                await MainActor.run {
                    self.tv.append(result)
                }
            }
        }
        
        await MainActor.run {
            self.welcome = results
			DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
				self.isLoading = false
			}
        }
    }
    
}
