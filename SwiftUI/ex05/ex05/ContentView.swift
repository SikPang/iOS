//
//  ContentView.swift
//  ex05
//
//  Created by kwsong on 2023/01/16.
//

import SwiftUI

struct ContentView: View {
    @State private var count: Float = 0
    @State private var age: Float = 0
    @State private var nameIndex = 0
    
    var names = ["tom", "john", "hana", "peter"]
    
    var body: some View {
        VStack
        {
            VStack {
                // Slider
                Form
                {
                    Slider(value: self.$count, in: 0...10){
                        Text("Count")
                    }
                    Text("Count: \(Int(self.count))")
                    
                    Slider(value: self.$age, in: 0...100)
                    {
                        Text("Age")
                    }
                    Text("Age:\(Int(self.age))")
                }
            }
            
            
            
            // Picker
            VStack{
                NavigationView{
                    Form {
                        Section{
                            Picker(selection: self.$nameIndex, label:
                                    Text("Names"))
                            {
                                ForEach(0 ..< names.count)
                                {
                                    Text(self.names[$0]).tag($0)
                                }
                            }
                        }
                    }.navigationBarTitle(Text("Names"))
                }
                Text("Picker Seleted: \(nameIndex)")
                
                Form {
                    Section{
                        Picker(selection: self.$nameIndex, label:
                                Text("Names"))
                        {
                            ForEach(0 ..< names.count)
                            {
                                Text(self.names[$0]).tag($0)
                            }
                        }
                        // Dropdown이 아닌 선택 메뉴
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }.navigationBarTitle(Text("Names"))
            }
            Text("Picker Seleted: \(nameIndex)")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
