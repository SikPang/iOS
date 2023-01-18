//
//  ContentView.swift
//  Cafe_App
//
//  Created by kwsong on 2023/01/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView
        {
            ZStack
            {
                Color.init(red: 1.0, green: 1.0, blue: 0.356).ignoresSafeArea()
                VStack
                {
                    Spacer()
                    
                    Text("Take it easy").font(Font.custom("Copperplate", size: 18)).foregroundColor(Color(red: 0.125, green: 0.176, blue: 1.0))
                    Text("Song's Coffee").font(Font.custom("Arial Rounded MT Bold", size: 40)).foregroundColor(Color(red: 0.125, green: 0.176, blue: 1.0)).padding(.bottom, 20.0)
                    
                    VStack(spacing: 10)
                    {
                        Button {
                            print("button1 clicked")
                        } label: {
                            NavigationLink(destination: Menu1View())
                            {
                                Text("Coffee").foregroundColor(.black)
                                    .padding(.horizontal)
                                    .frame(width: 150.0, height: 30.0, alignment: .center)
                                    .background(.white)
                            }
                        }
                        
                        Button {
                            print("button2 clicked")
                        } label: {
                            NavigationLink(destination: Menu2View())
                            {
                                Text("Beverage").foregroundColor(.black)
                                    .padding(.horizontal)
                                    .frame(width: 150.0, height: 30.0, alignment: .center)
                                    .background(.white)
                            }
                        }
                        
                        Button {
                            print("button3 clicked")
                        } label: {
                            NavigationLink(destination: Menu3View()) {
                                Text("Dessert").foregroundColor(.black)
                                    .padding(.horizontal)
                                    .frame(width: 150.0, height: 30.0, alignment: .center)
                                    .background(.white)
                            }
                        }
                        
                        Button {
                            print("button4 clicked")
                        } label: {
                            NavigationLink(destination: Menu4View()) {
                                Text("Special").foregroundColor(.black)
                                    .padding(.horizontal)
                                    .frame(width: 150.0, height: 30.0, alignment: .center)
                                    .background(.white)
                            }
                        }
                        
                        Button {
                            print("button5 clicked")
                        } label: {
                            NavigationLink(destination: Menu5View())
                            {
                                Text("Find Store").foregroundColor(.black)
                                    .padding(.horizontal)
                                    .frame(width: 150.0, height: 30.0, alignment: .center)
                                    .background(.white)
                            }
                        }
                    }   // Button VStack
                    
                    Spacer()
                }   // VStack
            }   // ZStack
        }   // NavigationView
    }   // body
}   // ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
