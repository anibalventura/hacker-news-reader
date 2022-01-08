//
//  NewsDetailView.swift
//  HackerNews
//
//  Created by Anibal Ventura on 7/1/22.
//

import SwiftUI

struct NewsDetailView: View {
    private let url: String

    init(_ url: String) {
        self.url = url
    }

    var body: some View {
        Text(url)
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView("https://www.google.com")
    }
}
