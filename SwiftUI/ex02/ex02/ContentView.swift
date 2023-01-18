//
//  ContentView.swift
//  ex02
//
//  Created by kwsong on 2023/01/16.
//

import SwiftUI

struct ContentView: View
{
    var body: some View
    {
        VStack
        {
            Image("pic")
                .resizable()
                // 더 큰 쪽에 맞춰짐
                .scaledToFit()
            Divider()
            Image(systemName: "play.circle")
                .resizable()
                // scaleToFit() 이랑 같음
                // .fill : 꽉 채우기
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.red)
            Divider()
            Text("My Image")
                .background(Image("pic")
                    .resizable()
                    // 배경의 frame
                    .frame(width: 300, height: 300, alignment: .center))
                // 텍스트뷰의 frame
                .frame(width: 300, height: 300, alignment: .center)
                .foregroundColor(.white)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.red, lineWidth: 5))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
