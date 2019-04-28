//
//  Data.swift
//  DominoPizzaExam
//
//  Created by hyeoktae kwon on 26/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import Foundation




protocol basicData {
    var folder: String {get}
    var Name: String {get}
    var count: Int {get set}
    var price: Int {get}
}

struct Category: basicData {
    var folder: String
    
    var Name: String
    
    var count: Int
    
    var price: Int
    
}

struct Data {
    static var shared = Data()
    private init(){}
    
    var countDict = [String:Int]()
 
    let logos: [String] = ["슈퍼시드", "프리미엄", "클래식", "사이드디시", "음료", "피클소스"]
    
    let pizzas: [basicData] = [
        Category(folder: "프리미엄", Name: "더블크러스트 이베리코", count: 0, price: 10000),
        Category(folder: "프리미엄", Name: "블랙앵거스 스테이크", count: 0, price: 10000),
        Category(folder: "프리미엄", Name: "블랙타이거 슈림프", count: 0, price: 10000),
        Category(folder: "프리미엄", Name: "와규 앤 비스테카", count: 0, price: 10000),
        Category(folder: "프리미엄", Name: "직화 스테이크", count: 0, price: 10000),
        Category(folder: "프리미엄", Name: "베이컨체더치즈", count: 0, price: 10000),
        Category(folder: "클래식", Name: "불고기", count: 0, price: 10000),
        Category(folder: "클래식", Name: "슈퍼디럭스", count: 0, price: 10000),
        Category(folder: "클래식", Name: "슈퍼슈프림", count: 0, price: 10000),
        Category(folder: "클래식", Name: "페퍼로니", count: 0, price: 10000),
        Category(folder: "클래식", Name: "포테이토", count: 0, price: 10000),
        Category(folder: "슈퍼시드", Name: "글램핑 바비큐", count: 0, price: 10000),
        Category(folder: "슈퍼시드", Name: "알로하 하와이안", count: 0, price: 10000),
        Category(folder: "슈퍼시드", Name: "우리 고구마", count: 0, price: 10000),
        Category(folder: "슈퍼시드", Name: "콰트로 치즈 퐁듀", count: 0, price: 10000),
        Category(folder: "사이드디시", Name: "딸기 슈크림", count: 0, price: 7000),
        Category(folder: "사이드디시", Name: "슈퍼곡물 치킨", count: 0, price: 7000),
        Category(folder: "사이드디시", Name: "애플 크러스트 디저트", count: 0, price: 7000),
        Category(folder: "사이드디시", Name: "치킨퐁듀 그라탕", count: 0, price: 7000),
        Category(folder: "사이드디시", Name: "퀴노아 치킨 샐러드", count: 0, price: 7000),
        Category(folder: "사이드디시", Name: "포테이토 순살치킨", count: 0, price: 7000),
        Category(folder: "음료", Name: "미닛메이드 스파클링 청포도", count: 0, price: 3000),
        Category(folder: "음료", Name: "스프라이트", count: 0, price: 3000),
        Category(folder: "음료", Name: "코카콜라 제로", count: 0, price: 3000),
        Category(folder: "음료", Name: "코카콜라", count: 0, price: 3000),
        Category(folder: "피클소스", Name: "갈릭 디핑 소스", count: 0, price: 500),
        Category(folder: "피클소스", Name: "스위트 칠리소스", count: 0, price: 500),
        Category(folder: "피클소스", Name: "우리 피클 L", count: 0, price: 500),
        Category(folder: "피클소스", Name: "우리 피클 M", count: 0, price: 500),
        Category(folder: "피클소스", Name: "핫소스", count: 0, price: 500),
    ]
    
    
    
}
