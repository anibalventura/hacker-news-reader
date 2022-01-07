//
//  NewsDetailView.swift
//  HackerNews
//
//  Created by Anibal Ventura on 7/1/22.
//

import SwiftUI

struct NewsDetailView: View {
    let newsURL: String

    var body: some View {
        Text(newsURL)
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(newsURL: "Hello World!")
    }
}
