//
//  ContentView.swift
//  ex04
//
//  Created by kwsong on 2023/01/16.
//

import SwiftUI

struct ContentView: View {
    // 상태변수 : 컨트롤 뷰와 변수 사이의 데이터를 공유
    @State private var isToggleOn = false
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var count: Int = 0
    @State private var age: Int = 0
    
    func incrementStepper()
    {
        print("incerment")
        self.age += 1
    }
    
    func decrementStepper()
    {
        print("decrement")
        self.age -= 1
    }
    
    var body: some View {
        VStack
        {
            // Toggle
            VStack
            {
                // 상태변수 호출, 토글이 켜지면 변수의 값이 바뀜
                Toggle(isOn: self.$isToggleOn)
                {
                    Text("Toggle")
                }
                .frame(width: 110)
                
                if self.isToggleOn
                {
                    Text("Toggle On")
                }
                else
                {
                    Text("Toggle Off")
                }
                
                Toggle(isOn: self.$isToggleOn)
                {
                    Text("Toggle2")
                }
                .frame(width: 120)
                .padding()
                .toggleStyle(SwitchToggleStyle(tint: Color.orange))
            }
            VStack
            {
                TextField("이메일", text: self.$email)
                SecureField("비밀번호", text: self.$password)
            }
            
            Text("입력된 이메일 : \(email)")
            Text("입력된 비밀번호 : \(password)")
            
            // 컨트롤 뷰를 이쁘게 꾸며주는 뷰
            // TextField
            Form
            {
                VStack
                {
                    TextField("이메일", text: self.$email)
                        .keyboardType(.emailAddress)
                    Divider()
                    SecureField("비밀번호", text: self.$password)
                }
                
                Text("입력된 이메일 : \(email)")
                Text("입력된 비밀번호 : \(password)")
                
                HStack
                {
                    Button(action: {
                        self.hidekeyboard()
                    })
                    {
                        Text("입력완료")
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            // Stepper
            VStack
            {
                Form
                {
                    // 간단하게 제어
                    // 범위가 0~10까지만
                    Stepper(value: self.$count, in: 0...10)
                    {
                        Text("Count")
                    }
                    Text("Count: \(self.count)")
                    
                    // 디테일하게 제어
                    Stepper(onIncrement: incrementStepper, onDecrement : decrementStepper)
                    {
                        Text("Age")
                    }
                    Text("Age: \(self.age)")
                }
            }
        }
    }
}
#if canImport(UIKit)
extension View
{
    func hidekeyboard()
    {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
