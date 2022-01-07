//
//  PostModel.swift
//  HackerNews
//
//  Created by Anibal Ventura on 7/1/22.
//

import Foundation

struct Post: Identifiable, Codable {
    let id: Int
    let title: String
}
