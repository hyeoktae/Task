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
    
    var date: Date {
        get {
            return Date()
        }
    }
    var cal = Calendar.current
    var arr: DateComponents {
        get {
        return cal.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        }
    }
    
    func currentDate()-> String {
        return "\(arr.year!)년 \(arr.month!)월 \(arr.day!)일  \(arr.hour!)시 \(arr.minute!)분"
    }
}

protocol Info {
    var editHeader: String? {get set}
    var idx: IndexPath? {get set}
}

struct EditInfo: Info {
    var editHeader: String?
    var idx: IndexPath?
}

var datas = [String:[DataModel]]()
var expandable = [String:Bool]()

protocol Data {
    var title: String {get set}
    var contents: String {get set}
}

class DataModel: Data {
    var title: String
    var contents: String
    
    init(title: String?, contents: String?) {
        self.title = title ?? "제목없음"
        self.contents = contents ?? ""
    }
}
