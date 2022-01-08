//
//  NewsViewModel.swift
//  HackerNews
//
//  Created by Anibal Ventura on 7/1/22.
//

import Foundation
import Alamofire

class NewsViewModel: ObservableObject {
    @Published private(set) var lastStories: [Story]?
    @Published private(set) var matchStories: [Story]?

    private let hackerNewsBaseURL: String = "http://hn.algolia.com/api/v1"

    func fetchLastStories() {
        let url = "\(hackerNewsBaseURL)/search_by_date?tags=story"

        AF.request(url).responseDecodable(of: Story.Results.self) { response in
            switch response.result {
            case .success(let data):
                self.lastStories = data.hits
            case .failure(let error):
                debugPrint(error)
            }
        }
    }

    func fetchMatchStories(for query: String) {
        let url = "\(hackerNewsBaseURL)/search?query=\(query)"

        AF.request(url).responseDecodable(of: Story.Results.self) { response in
            switch response.result {
            case .success(let data):
                self.matchStories = data.hits
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
