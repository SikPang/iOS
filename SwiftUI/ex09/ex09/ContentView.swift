//
//  ContentView.swift
//  ex09
//
//  Created by kwsong on 2023/01/17.
//

import SwiftUI

struct ContentView: View {
    // 다크모드, 라이트모드
    @Environment(\.colorScheme) private var colorScheme
    
    // 언어 설정
    @Environment(\.locale) private var locale
    
    // 달력
    @Environment(\.calendar) private var calendar
    
    // 가로 사이즈
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    // 세로 사이즈
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    
    
    var body: some View {
        VStack {
            Text(colorScheme == .dark ? "Dark mode" : "Light mode")
            Text(locale.description)
            Text(calendar.description)
            Text(horizontalSizeClass == .compact ? "Compact" : "Regular")
            Text(verticalSizeClass == .compact ? "Compact" : "Regular")
            // regular : UI가 공간을 많이 차지하게 된다
            // compact : UI가 제한된 영역에 보이게 된다
            
            if verticalSizeClass == .regular
            {
                VStack
                {
                    Text("Alice")
                    Text("Bob")
                    Text("John")
                }
                .background(.yellow)
            }
            else
            {
                VStack
                {
                    Text("Alice")
                    Text("Bob")
                    Text("John")
                }
                .background(.green)
            }
            
            colorScheme == .dark ? Color.black.edgesIgnoringSafeArea(.all) : Color.yellow.edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group
        {
            ContentView()
                .environment(\.colorScheme, .light)
            ContentView()
                .environment(\.colorScheme, .dark)
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
                .previewDisplayName("iPhone 12")
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
                .previewDisplayName("iPhone 12 Pro Max")
        }
    }
}
