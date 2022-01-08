//
//  WebView.swift
//  HackerNews
//
//  Created by Anibal Ventura on 7/1/22.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: String?

    init(_ url: String?) {
        self.url = url
    }

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: url!) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}
