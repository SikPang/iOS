//
//  Menu3View.swift
//  Cafe_App
//
//  Created by kwsong on 2023/01/17.
//

import Foundation
import SwiftUI
import AlertToast

private let names: Array<String> = ["노말한소프트",
                            "옥수크림",
                            "사라다빵",
                            "호두크런치",
                            "빽엔나",
                            "소세지빵",
                            "크리미슈",
                            "크리미단팥빵",
                            "계란사라다빵"]
private let prices: Array<String> = ["1,500",
                               "2,500",
                               "2,000",
                               "3,000",
                               "HOT : 3,000\nICED : 3,500",
                               "2,500",
                               "1,500",
                               "1,500",
                               "3,500"]
private let images: Array<String> = ["http://paikdabang.com/wp-content/uploads/2018/05/%EB%85%B8%EB%A7%90%ED%95%9C%EC%86%8C%ED%94%84%ED%8A%B8.jpg",
                             "http://paikdabang.com/wp-content/uploads/2018/05/%EC%98%A5%EC%88%98%ED%81%AC%EB%A6%BC.jpg",
                             "http://paikdabang.com/wp-content/uploads/2018/05/%EC%82%AC%EB%9D%BC%EB%8B%A4%EB%B9%B5.jpg",
                             "http://paikdabang.com/wp-content/uploads/2018/05/%ED%98%B8%EB%91%90%ED%81%AC%EB%9F%B0%EC%B9%98.jpg",
                             "http://paikdabang.com/wp-content/uploads/2018/05/%EB%BA%B5%EC%97%94%EB%82%98.jpg",
                             "http://paikdabang.com/wp-content/uploads/2018/05/%EC%86%8C%EC%84%B8%EC%A7%80%EB%B9%B5.jpg",
                             "http://paikdabang.com/wp-content/uploads/2018/05/%ED%81%AC%EB%A6%AC%EB%AF%B8%EC%8A%88.jpg",
                             "http://paikdabang.com/wp-content/uploads/2018/05/%ED%81%AC%EB%A6%AC%EB%AF%B8%EB%8B%A8%ED%8C%A5%EB%B9%B5.jpg",
                             "http://paikdabang.com/wp-content/uploads/2018/05/%EA%B3%84%EB%9E%80%EC%82%AC%EB%9D%BC%EB%8B%A4%EB%B9%B5.jpg"]
private let messages: Array<String> = ["입안에서 부드럽게 사르륵 녹는 마성의 아이스크림",
                               "달콤한 아이스크림에 고소한 옥수수가 톡톡 씹히는 재미난 메뉴",
                               "어린시절 빵집에서 사먹던 추억의 감자 사라다빵",
                               "호두, 땅콩, 크런치의 바삭바삭함이 즐거운 아이스크림",
                               "부드러운 아이스크림과 쌉싸름한 아메리카노가 조화를 이루는 빽다방식 아포가토",
                               "소시지에 치즈를 듬뿍 얹고 옥수수까지 더한 소세지빵",
                               "비스킷과 부드러운 크림의 환상 조합!",
                               "달콤한 팥과 크림이 듬뿍~",
                               "계란이 듬뿍 들어간 부드러운 식감의 촉촉한 계란사라다빵!"]

struct Menu3View: View
{
    @State private var showToast = false
    @State private var toastMessage = "..."
    
    var body: some View
    {
        var menuList: Array<Menu> = Array()
        var index = 0
        for _ in names
        {
            let menu: Menu = Menu(name: names[index], price: prices[index], imageUrl: images[index], message: messages[index])
            
            menuList.append(menu)
            index += 1
        }
        return List(menuList)
        {
            menu in
            
            MenuRow(menu: menu, showToast: self.$showToast, toastMessage: self.$toastMessage)
        }
        .navigationTitle("Beverage")
        .navigationBarTitleDisplayMode(.inline)
        .toast(isPresenting: self.$showToast) {
            AlertToast(displayMode: .banner(.pop), type: .regular, title: self.toastMessage)
        }
    }
}

struct Menu3View_Previews: PreviewProvider {
    static var previews: some View {
        Menu1View()
    }
}
