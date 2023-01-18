//
//  ContentView.swift
//  ex10
//
//  Created by kwsong on 2023/01/17.
//

import SwiftUI

// 14.0 이상 모든 버전에서 사용 가능함
@available(iOS 14.0, *)
struct LoginCheck : View
{
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: "isLoggedIn")
    var body: some View
    {
        if isLoggedIn
        {
            Button {
                self.isLoggedIn = false
            } label: {
                Text("LogOut")
            }
        }
        else
        {
            Button {
                self.isLoggedIn = true
            } label: {
                Text("LogIn")
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack
        {
            // AppStorage
            VStack
            {
                LoginCheck()
            }
            
            Divider()
            
            // Navigation View
            VStack
            {
                NavigationView
                {
                    Text("Main View")
                        .navigationTitle("Title")
                        // automatic : 이전 뷰의 타이틀 속성을 따라감
                        // large : 상단 왼쪽 타이틀
                        // inline : 상단 중앙 타이틀
                        .navigationBarTitleDisplayMode(.automatic)
                }
            }
            
            Divider()
            
            VStack
            {
                NavigationView
                {
                    // 화면 전환 - 선언한 구조체로
                    NavigationLink(destination: SecondView())
                    {
                        Text("Go to Second View")
                    }
                    .navigationTitle("Main View")
                    // 바에 버튼 달기
                    .navigationBarItems(leading: Button(action: {
                        print("Home button Clicked")
                    }, label: {
                            Text("Home")
                    }), trailing: Button(action: {
                        print("Edit button clicked")
                    }, label: {
                        Text("Edit")
                    }))
                }
            }
            
            Divider()
            
            VStack
            {
                NavigationView
                {
                    NavigationLink(destination: SecondView(), label:
                    {
                        // 이미지로 버튼 링크
                        Image(systemName: "play")
                            // original : 이미지의 원래 색상
                            // template : 단색으로 표현
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                    })
                }
            }
        }
    }
}

// 구조체 이용
struct SecondView: View
{
    var body: some View
    {
        ZStack
        {
            Color.yellow
            Text("Second View")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
