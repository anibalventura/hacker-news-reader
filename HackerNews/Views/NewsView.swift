//
//  ContentView.swift
//  HackerNews
//
//  Created by Anibal Ventura on 7/1/22.
//

import SwiftUI

struct NewsView: View {
    @ObservedObject private var newsViewModel: NewsViewModel = NewsViewModel()
    @State private var showAlert: Bool = false

    var body: some View {
        NavigationView {
            List(newsViewModel.posts) { post in
                NavigationLink(destination: NewsDetailView(newsURL: post.title)) {
                    NewsItem(post: post)
                }
            }
            .navigationTitle("Hacker News")
            .refreshable {
                fetchNews()
            }
            .alert("Cannot fetch news! \nTry again later.", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
        }
        .onAppear {
            fetchNews()
        }
    }

    private func fetchNews() {
        newsViewModel.fetchNews()

        if newsViewModel.posts.isEmpty {
            self.showAlert = true
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
