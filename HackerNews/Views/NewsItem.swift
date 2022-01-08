//
//  NewsItem.swift
//  HackerNews
//
//  Created by Anibal Ventura on 7/1/22.
//

import SwiftUI

struct NewsItem: View {
    let story: Story

    var body: some View {
        HStack {
            Text("\(story.points)")

            VStack(alignment: .leading) {
                Text(story.title)
                    .font(.headline)

                HStack {
                    Text("Author: \(story.author)")
                    Text("Comments: \(story.numComents)")
                }
                .font(.subheadline)
            }
        }
    }
}
