//
//  MyWebView.swift
//  Cafe_App
//
//  Created by kwsong on 2023/01/17.
//

import SwiftUI
import WebKit

struct MyWebView: UIViewRepresentable {
    var urlToLoad: String
    
    func makeUIView(context: Context) -> WKWebView
    {
        guard let url = URL(string: self.urlToLoad) else
        {
            return WKWebView()
        }
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebView>) {
        
    }
}

struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView(urlToLoad: "")
    }
}
