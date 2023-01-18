//
//  ContentView.swift
//  ex06
//
//  Created by kwsong on 2023/01/16.
//

import SwiftUI

struct ContentView: View {
    @State var username: String = ""
    @State var isPrivate: Bool = true
    @State var notifications: Bool = false
    @State private var previewIndex = 0
    let previewOptions: Array<String> = [ "Always", "When Unlocked", "Never"]
    
    var body: some View {
        VStack {
            // ScrollView
            ScrollView()
            {
                VStack
                {
                    ForEach(1..<31)
                    {
                        index in
                        Text("Count\(index)")
                    }
                }
                // 너비 꽉 채우기
                .frame(maxWidth: .infinity)
            }
            // 높이 지정하기
            .frame(height: 150)
            .background(.orange)
            
            Divider()
            
            ScrollView(.horizontal, showsIndicators: false)
            {
                HStack
                {
                    ForEach(1..<31)
                    {
                        index in
                        Text("Count\(index)")
                    }
                }
                .frame(height: 50)
                .background(.purple)
            }
            
            Divider()

            //FormView
            NavigationView
            {
                Form
                {
                    Section(header: Text("PROFILE"))
                    {
                        TextField("Username", text: self.$username)
                        Toggle(isOn: self.$isPrivate)
                        {
                            Text("Private Account")
                        }
                    }
                    
                    Section(header: Text("NOTIFICATION"))
                    {                        Toggle(isOn: self.$notifications)
                        {
                            Text("Enabled")
                        }
                        Picker(selection: self.$previewIndex, label: Text("Show Previews"))
                        {
                            ForEach(0..<previewOptions.count)
                            {
                                index in
                                Text(self.previewOptions[index])
                            }
                        }
                    }
                    
                    Section(header: Text("ABOUT"))
                    {
                        HStack{
                            Text("Version")
                            Spacer()
                            Text("2.0.1")
                        }
                    }
                    
                    Section
                    {
                        Button(action : {
                            print("button clicked")
                        })
                        {
                            Text("Reset All Settings")
                        }
                    }
                }
                .navigationTitle("Settings")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
