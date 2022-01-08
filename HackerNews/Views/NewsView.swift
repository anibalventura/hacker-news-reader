//
//  ContentView.swift
//  HackerNews
//
//  Created by Anibal Ventura on 7/1/22.
//

import SwiftUI

struct NewsView: View {
    @ObservedObject private var newsViewModel: NewsViewModel = NewsViewModel()
    @State private var search: String = ""
    @State private var showAlert: Bool = false

    private var stories: [Story]? {
        if search.isEmpty && newsViewModel.lastStories != nil {
            return newsViewModel.lastStories
        } else {
            newsViewModel.fetchMatchStories(for: search)
            return newsViewModel.matchStories
        }
    }

    var body: some View {
        NavigationView {
            if stories != nil {
                List(stories!) { story in
                    NavigationLink(destination: NewsDetailView(story.url)) {
                        NewsItem(story: story)
                    }
                }
                .navigationTitle("Hacker News")
                .searchable(text: $search, placement: .navigationBarDrawer(displayMode: .always))
                .refreshable {
                    newsViewModel.fetchLastStories()
                }
            } else {
                Text("Error! Cannot load news.")
                    .navigationTitle("Hacker News")
            }
        }
        .onAppear {
            newsViewModel.fetchLastStories()
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
