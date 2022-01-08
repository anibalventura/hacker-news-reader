//
//  NewsItem.swift
//  HackerNews
//
//  Created by Anibal Ventura on 7/1/22.
//

import SwiftUI

struct NewsItem: View {
    let post: Post

    var body: some View {
        HStack {
            Text("\(post.points)")

            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.headline)

                HStack {
                    Text("Author: \(post.author)")
                    Text("Comments: \(post.numComents)")
                }
                .font(.subheadline)
            }
        }
    }
}
