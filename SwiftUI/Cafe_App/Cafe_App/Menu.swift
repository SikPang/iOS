//
//  Menu.swift
//  Cafe_App
//
//  Created by kwsong on 2023/01/17.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

// 인덱스로 사용할 수 있는 구조체
struct Menu: Identifiable
{
    var id = UUID() // 유일 아이디 (문자 64자) 유니크
    var name: String
    var price: String
    var imageUrl: String
    var message: String
}

struct MenuRow: View
{
    var menu: Menu
    @Binding var showToast: Bool
    @Binding var toastMessage: String
    
    var body: some View
    {
        HStack
        {
            WebImage(url: URL(string: menu.imageUrl))
                .renderingMode(.original)
                .resizable()
                .placeholder{
                    Rectangle().foregroundColor(.gray)
                }
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
            Text("\(menu.name)")
                .font(.title3)
                .multilineTextAlignment(.leading)
                .frame(width: 150)
            Text("\(menu.price)")
                .font(.footnote)
        }
        .onTapGesture {
            print(menu.message)
            self.toastMessage = menu.message
            self.showToast.toggle()
        }
    }
}
