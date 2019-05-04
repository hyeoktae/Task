//
//  Data.swift
//  TestDiary
//
//  Created by hyeoktae kwon on 29/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation
import UIKit

class CurrentDate {
    static let shared = CurrentDate()
    
    private init(){}
    // 현재 시간은 계산porperty로 선언 할 때 마다 갱신
    var date: Date {
        get {
            return Date()
        }
    }
    // Calendar의 현재값 가져옴
    var cal = Calendar.current
    // 현재시점의 연 월 일 시 분 을 가져옴
    var arr: DateComponents {
        get {
        return cal.dateComponents([.year,.month,.day,.hour,.minute], from: date)
        }
    }
    // arr속의 속성을 반환하는 함수
    func currentDate()-> String {
        return "\(arr.year!)년 \(arr.month!)월 \(arr.day!)일  \(arr.hour!)시 \(arr.minute!)분"
    }
}
// 수정할 때 수정을 해야하는 header를 저장해둠
protocol Info {
    var editHeader: String? {get set}
    var idx: IndexPath? {get set}
}
// Info protocol 채택
struct EditInfo: Info {
    var editHeader: String?
    var idx: IndexPath?
}
// title & contents 를 실제 저장하는 배열, userdefaults나 다른 방법을 통해 저장해야함
var datas = [String:[DataModel]]()
// 현재의 헤더의 expand상태
var expandable = [String:Bool]()
// title & contents의 프로토콜
protocol Data {
    var title: String {get set}
    var contents: String {get set}
}
// Data protocol 채택
class DataModel: Data {
    var title: String
    var contents: String
    
    init(title: String?, contents: String?) {
        self.title = title ?? "제목없음"
        self.contents = contents ?? ""
    }
}
