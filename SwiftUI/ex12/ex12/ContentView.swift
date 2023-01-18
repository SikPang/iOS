//
//  ContentView.swift
//  ex12
//
//  Created by kwsong on 2023/01/17.
//

import SwiftUI

// Life Cycle Test
// 실행 -> 모든 뷰 Init
// 현재 화면 Appear
// 화면 전환시 다음 화면 Appear, 이전 화면 Disappear

// SwiftUI2 부터는 ScenePhase 기능을 제공
// active : 화면 표시 상태
// inactive : 살짝 올려놓은 멀티태스킹 상태
// background : 바탕으로 나간 상태
struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase
    init()
    {
        print("Initialized : Content")
    }
    
    var body: some View {
        VStack {
            NavigationView
            {
                NavigationLink(destination: DetailView())
                {
                    Text("Detail View")
                        .onChange(of: scenePhase)
                    {
                        newPhase in
                        
                        if newPhase == .inactive
                        {
                            print("inactive")
                        }
                        else if newPhase == .active
                        {
                            print("active")
                        }
                        else if newPhase == .background
                        {
                            print("background")
                        }
                    }
                }
                .onAppear
                {
                    print("Content View Appear")
                }
                .onDisappear()
                {
                    print("Content View Disappear")
                }
                
            }
        }
    }
}

struct DetailView: View {
    init()
    {
        print("Initialized : Detail")
    }
    
    var body: some View {
        VStack {
            Text("Hello world!")
                .onAppear
            {
                print("Detail View Appear")
            }
            .onDisappear
            {
                print("Detail View Disappear")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
