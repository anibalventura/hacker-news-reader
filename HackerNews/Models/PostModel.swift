//
//  PostModel.swift
//  HackerNews
//
//  Created by Anibal Ventura on 7/1/22.
//

import Foundation

struct Post: Identifiable, Codable {
    var id: String {
        objectID
    }
    let title: String
    let url: String?
    let author: String
    let points: Int
    let numComents: Int
    let objectID: String

    enum CodingKeys: String, CodingKey {
        case title
        case url
        case author
        case points
        case numComents = "num_comments"
        case objectID
    }
}

struct PostResults: Codable {
    let hits: [Post]
}
