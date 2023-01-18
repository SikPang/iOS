//
//  ContentView.swift
//  ex08
//
//  Created by kwsong on 2023/01/17.
//

import SwiftUI
import Foundation

class Counter : ObservableObject
{
    @Published var count: Int = 0
    
    init()
    {
        
    }
    
    func add()
    {
        self.count += 1
    }
}

struct CounterView: View
{
    // Class와 Struct 사이의 값을 공유할 때 사용한다.
    // 뷰의 라이프 사이클에 의존, 소멸할 때 같이 사라짐
    //@ObservedObject var counter: Counter = Counter()
    
    // @StateObject는 옵저버블을 인스턴스화하고 @Published 속성으로 선언된 프로퍼티의 값이 변할 때 뷰를 업데이트함
    // 뷰의 라이프 사이클에 의존하지 않음, 값 유지
    @StateObject var counter: Counter = Counter()
    
    var body: some View
    {
        HStack
        {
            Text("\(counter.count)")
            Button {
                self.counter.add()
            } label: {
                Text("Add")
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

// MVC 패턴 (Model, View, Controller) : 모델(데이터), 뷰(UI), 컨트롤러(제어코드)로 화면을 구현하는 소프트웨어 UI 개발모델
// 세가지가 너무 의존하여 수정할 때 힘들어짐

// MVVM 패턴 (Model, View, ViewModel) : 모델(데이터), 뷰(UI), 뷰모델(의존성이 없는 중간참조영역)로 화면을 구현하는 소프트웨어 UI 개발모델
// 의존성 없이 구현하여 수정이 편함


// Model
struct User {
    var name: String
    var age: Int
}

// ViewModel
class ContentViewModel : ObservableObject
{
    // User라는 구조체를 선언함
    @Published var hong: User = User(name: "hong", age: 30)
}

// View
struct ContentView: View {
    @ObservedObject var contentViewModel = ContentViewModel()
    
    @State private var isChanged: Bool = false
    
    var body: some View {
        VStack
        {
            // MVVM pattern
            VStack {
                Text("name: \(self.contentViewModel.hong.name)")
                Text("age: \(self.contentViewModel.hong.age)")
                Button{
                    self.contentViewModel.hong.name = "gildong"
                    self.contentViewModel.hong.age = 40
                } label:{
                    Text("Change Info")
                }
            }
            .font(.largeTitle)
            
            Divider()
            
            // StateObject
            VStack
            {
                CounterView(counter: Counter())
                    .background(isChanged ? Color.red : Color.green)
                    .padding()
                
                Button
                {
                    self.isChanged.toggle()
                }label: {
                    Text("Change")
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
