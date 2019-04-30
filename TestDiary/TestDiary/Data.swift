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
        return "\(arr.year!)-\(arr.month!)-\(arr.day!), \(arr.hour!):\(arr.minute!))"
    }
}

protocol Data {
    var title: String {get set}
    var contents: String {get set}
}


struct DataModel: Data {
    var title: String
    var contents: String
    
    init(title: String?, contents: String?) {
        self.title = title ?? "제목없음"
        self.contents = contents ?? ""
    }
}

class DataModels {
    
    var headerName = String()
    var isExpandable: Bool = false
    var datas: [DataModel] = []
    
    init(data: DataModel) {
        self.datas.append(data)
        self.headerName = CurrentDate.shared.currentDate()
        self.isExpandable = false
    }
}
