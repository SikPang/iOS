//
//  ContentView.swift
//  ex07
//
//  Created by kwsong on 2023/01/16.
//

import SwiftUI

struct ContentView: View {
    @State var sharedData: String = "init value"
    
    @ObservedObject var myTimer = Mytimer()
    
    var body: some View {
        VStack
        {
            // State 변수와 Binding 변수
            VStack
            {
                Text("Shared Data : \(self.sharedData)")
                CustomBuoon1(sharedData: self.$sharedData)
                CustomBuoon2(sharedData: self.$sharedData)
            }
            
            Divider()
            
            // ObservedObject
            VStack
            {
                Text("Timer : \(myTimer.value)")
                    .font(.largeTitle)
            }
        }
    }
}

struct CustomBuoon1 : View
{
    // 맨 위의 State 변수 sharedData와 공유 (전역변수)
    @Binding var sharedData: String
    
    var body: some View
    {
        Button(action: {
            self.sharedData = "Button1 Clicked!"
        }, label: {
            Text("Button1")
        })
        
    }
}

struct CustomBuoon2 : View
{
    // 맨 위의 State 변수 sharedData와 공유 (전역변수)
    @Binding var sharedData: String
    
    var body: some View
    {
        Button(action: {
            self.sharedData = "Button2 Clicked!"
        }, label: {
            Text("Button2")
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
