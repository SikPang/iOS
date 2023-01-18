//
//  ContentView.swift
//  ex11
//
//  Created by kwsong on 2023/01/17.
//

import SwiftUI

// Model
struct CarMaker
{
    let name: String
    let imageUrl: String
    let price: Int
}

extension CarMaker
{
    // 모든 데이터를 가져오는 정적 함수
    static func all() -> [CarMaker]
    {
        return [
            CarMaker(name: "Model S", imageUrl: "model-s", price: 1000),
            CarMaker(name: "Model 3", imageUrl: "model-3", price: 2000),
            CarMaker(name: "Model X", imageUrl: "model-x", price: 3000),
            CarMaker(name: "Model Y", imageUrl: "model-y", price: 4000)
        ]
    }
}

struct ContentView: View {
    // carMaker의 정보를 모두 가져옴 (배열)
    let carMakers = CarMaker.all()
    
    var body: some View
    {
        VStack
        {
            NavigationView
            {
                // 배열을 가져와 리스트로 뽑음
                List(self.carMakers, id: \.name)
                {
                    carMaker in
                    
                    // Detail로 Link함
                    NavigationLink(destination: CarMakerDetail(carMaker: carMaker))
                    {
                        // 각 리스트에 CarMakerCell 출력
                        CarMakerCell(carMaker: carMaker)
                    }
                }
            }
        }
    }
}

// 리스트에 출력될 내용
struct CarMakerCell: View
{
    // 구조체를 하나 선언하고 그 구조체에 대한 내용 출력
    // 틀이기 때문에 사용할 땐 인자로 넘겨줘야 함
    let carMaker: CarMaker
    
    var body: some View
    {
        HStack
        {
            Spacer()
            
            Image(carMaker.imageUrl)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(16)
                .frame(width: 128, height: 96, alignment: .center)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 5) {
                Text(carMaker.name).font(.largeTitle)
                Text("\(carMaker.price)원")
            }
        }
    }
}

// 디테일 페이지
struct CarMakerDetail: View
{
    @State var isPresent: Bool = false
    
    //여기도 구조체 하나 선언
    let carMaker: CarMaker
    
    var body: some View
    {
        VStack
        {
            Image(carMaker.imageUrl)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                // 탭 제스처, 2번 탭
                .onTapGesture(count: 2) {
                    self.isPresent = true
                }
            
            Text(carMaker.name)
        }
        // 알림창
        .alert(isPresented: $isPresent) {
            Alert(title: Text("double click"), message: Text("차 가격은 \(carMaker.price)입니다."), dismissButton: .default(Text("OK")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
