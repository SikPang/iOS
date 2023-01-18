//
//  Menu5View.swift
//  Cafe_App
//
//  Created by kwsong on 2023/01/17.
//

import SwiftUI

struct Menu5View: View {
    var body: some View {
        HStack
        {
            MyWebView(urlToLoad: "http://paikdabang.com/store/")
        }
        .navigationTitle("Find Store")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Menu5View_Previews: PreviewProvider {
    static var previews: some View {
        Menu5View()
    }
}
