//
//  ContentView.swift
//  HackerNews
//
//  Created by Anibal Ventura on 7/1/22.
//

import SwiftUI

struct NewsView: View {
    @ObservedObject private var newsViewModel: NewsViewModel = NewsViewModel()

    var body: some View {
        NavigationView {
            List(newsViewModel.posts) { post in
                NavigationLink(destination: NewsDetailView(post.url)) {
                    NewsItem(post: post)
                }
            }
            .navigationTitle("Hacker News")
            .refreshable {
                newsViewModel.fetchNews()
            }
        }
        .onAppear {
            newsViewModel.fetchNews()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
            .preferredColorScheme(.dark)

        NewsView()
            .preferredColorScheme(.light)
    }
}
