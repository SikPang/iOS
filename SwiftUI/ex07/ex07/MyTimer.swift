//
//  MyTimer.swift
//  ex07
//
//  Created by kwsong on 2023/01/16.
//

import Foundation

class Mytimer : ObservableObject
{
    @Published var value: Int = 0
    
    // 생성자
    init()
    {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true)
        {
            timer in
            self.value += 1
        }
    }
    
}
