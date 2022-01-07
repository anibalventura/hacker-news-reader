//
//  ContentView.swift
//  HackerNews
//
//  Created by Anibal Ventura on 7/1/22.
//

import SwiftUI

struct NewsView: View {
    private let posts: [Post] = [
        Post(id: 1, title: "Hello"),
        Post(id: 2, title: "Amazing"),
        Post(id: 3, title: "World!")
    ]

    var body: some View {
        NavigationView {
            List(posts) { post in
                NavigationLink(destination: NewsDetailView(newsURL: post.title)) {
                    Text(post.title)
                }
            }
            .navigationTitle("Hacker News")
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
