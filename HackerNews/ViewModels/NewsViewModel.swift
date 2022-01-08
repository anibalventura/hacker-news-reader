//
//  NewsViewModel.swift
//  HackerNews
//
//  Created by Anibal Ventura on 7/1/22.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published private(set) var lastStories: [Story] = [Story]()
    @Published private(set) var matchStories: [Story] = [Story]()

    private let networkManager: NetworkManager = NetworkManager()
    private let hackerNewsBaseURL: String = "http://hn.algolia.com/api/v1"

    func fetchLastStories() {
        let url = "\(hackerNewsBaseURL)/search_by_date?tags=story"

        networkManager.fetchData(from: url) { (result: Result<Story.Results, Error>) in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.lastStories = model.hits
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func fetchMatchStories(for query: String) {
        let url = "\(hackerNewsBaseURL)/search?query=\(query)"

        networkManager.fetchData(from: url) { (result: Result<Story.Results, Error>) in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.matchStories = model.hits
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
