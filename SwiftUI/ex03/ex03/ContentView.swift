//
//  ContentView.swift
//  ex03
//
//  Created by kwsong on 2023/01/16.
//

import SwiftUI

struct ContentView: View {
    func Play()
    {
        print("func Play")
    }
    var body: some View {
        VStack
        {
            // 클로저로 이벤트 발생
            Button(action:{print("Clicked")})
            {
                Text("Button")
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .font(.title)
            }
            
            Button(action:{print("Clicked")})
            {
                Text("Button")
                    .padding()
                    .foregroundColor(.purple)
                    .font(.title)
                    .padding()
                    .border(Color.purple, width: 5)
            }
            
            Button(action:{print("Play Clicked")
                // 함수 호출
                self.Play()
            })
            {
                Image(systemName: "play.circle")
                    .font(.largeTitle)
                    .foregroundColor(.red)
            }
            
            Button(action: {print("Play Clicked")})
            {
                HStack
                {
                    Image(systemName: "play.circle")
                        .font(.title)
                    Text("Play")
                        .fontWeight(.semibold)
                        .font(.title)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                // 노치 디자인 부분? 안보이는 영역 해줌
                .ignoresSafeArea()
                // 테두리 라운드
                .cornerRadius(40)
            }
            
            Button(action: {print("Play Clicked")})
            {
                HStack
                {
                    Image(systemName: "play.circle")
                        .font(.title)
                    Text("Play")
                        .fontWeight(.semibold)
                        .font(.title)
                }
                .padding()
                .foregroundColor(.white)
                // 그라데이션
                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
