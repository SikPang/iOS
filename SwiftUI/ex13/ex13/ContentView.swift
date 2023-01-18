//
//  ContentView.swift
//  ex13
//
//  Created by kwsong on 2023/01/17.
//

import SwiftUI

struct HomeView: View
{
    // 환경변수 공유
    @Binding var currentTab: Int
    
    var body: some View
    {
        VStack
        {
            Text("Home Tab")
                .font(.system(size:30, weight: .bold, design: .rounded))
            Button
            {
                print(self.currentTab)
                // 환경변수에 접근하여 값 변경
                // -> Bookmark tab으로 변경
                self.currentTab = 1
            } label: {
                Text("Bookmark tab")
            }
        }
    }
}

struct ContentView: View {
    // 상태변수
    @State private var currentTab: Int = 0
    
    @State private var showingAlert1: Bool = false
    @State private var showingAlert2: Bool = false
    
    var body: some View
    {
        // Tab View
        VStack
        {
            VStack
            {
                // 상태변수에 변경값 저장
                TabView(selection: $currentTab)
                {
                    // 탭에 들어가면 보일 화면
                    // 구조체로 가능
                    HomeView(currentTab: self.$currentTab)
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    // 탭 아이콘 및 텍스트
                        .tabItem({
                            Image(systemName: "house.fill")
                            Text("home")
                        })
                        .tag(0)
                    
                    Text("Bookmark Tab")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .tabItem({
                            Image(systemName: "bookmark.fill")
                            Text("bookmark")
                        })
                        .tag(1)
                    
                    Text("Video Tab")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .tabItem({
                            Image(systemName: "video.circle.fill")
                            Text("video")
                        })
                        .tag(2)
                }
                // 바뀌면 이벤트
                .onChange(of: currentTab) { newValue in
                    print(newValue)
                }
            }
            
            Divider()
            
            // Alert
            VStack
            {
                Button {
                    self.showingAlert1 = true
                } label: {
                    Text("show Alert1")
                }
                .alert(isPresented: $showingAlert1)
                {
                    Alert(title: Text("Title"), message: Text("알럿 메세지입니다."), dismissButton: .default(Text("확인")))
                }
                
                Button {
                    self.showingAlert2 = true
                } label: {
                    Text("show Alert2")
                }
                .alert(isPresented: $showingAlert2)
                {
                    Alert(title: Text("Title"), message: Text("알럿 메세지입니다."),
                          // 버튼 2개
                          primaryButton: .destructive(Text("확인"), action: {
                        print("OK")
                    }), secondaryButton: .cancel()
                    )
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
