//
//  ContentView.swift
//  ex01
//
//  Created by kwsong on 2023/01/15.
//

import SwiftUI

struct MyText : View
{
    // 기기의 설정을 가져옴
    @Environment(\.colorScheme) var colorScheme
    var body : some View
    {
        Text("Hello, iOS\nHello world\n Hello")
            .padding()
            // 글자 색깔, 라이트모드, 다크모드에 따라 다름
            .foregroundColor(colorScheme == .light ? Color.black
                             : Color.white)
            .font(.title)
            .frame(width: 100, height: 100)
            .lineLimit(2)
            // 테두리
            .border(Color.purple, width: 5)
            // 배경색, frame 밑에 있으므로 frame 기준
            .background(Color.gray)
    }
}

struct ContentView: View
{
    var body: some View
    {
        // 묶어서 모두 표현
        VStack
        {
            // Horizontal Stack (수평 방향)
            HStack
            {
                MyText()
                MyText()
                MyText()
            }
            // 구분선
            Divider()
            // Vertical Stack (수직 방향)
            VStack
            {
                
                MyText()
                MyText()
            }
            Divider()
            HStack(alignment: .center, spacing: 20)
            {
                MyText()
                MyText()
                MyText()
            }
            Divider()
            // 상하 방향, Overlay 중첩
            ZStack
            {
                Color.yellow.edgesIgnoringSafeArea(.all)
                Color.red.frame(width: 200, height: 200)
                Color.blue.frame(width: 100, height: 100)
            }
            .padding()
            .border(Color.red, width: 3)
            Divider()
            HStack(alignment: .top, spacing: 10)
            {
                Text("Hello").font(.caption)
                Text("Hello")
                Text("Hello").font(.title)
                Text("Hello").font(.largeTitle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentView()
                .environment(\.colorScheme, .light)
            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
}
