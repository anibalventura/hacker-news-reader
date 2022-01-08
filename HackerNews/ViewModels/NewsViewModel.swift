//
//  NewsViewModel.swift
//  HackerNews
//
//  Created by Anibal Ventura on 7/1/22.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published private(set) var posts: [Post] = [Post]()
    private let networkManager: NetworkManager = NetworkManager()

    func fetchNews() {
        let url = "http://hn.algolia.com/api/v1/search?tags=front_page" // Hacker News API.

        networkManager.fetchData(from: url) { (result: Result<Post.Results, Error>) in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.posts = model.hits
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
