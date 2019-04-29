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
        return "\(arr.year!)-\(arr.month!)-\(arr.day!), \(arr.hour!):\(arr.minute!),\(arr.second!)"
    }
}

class DataModel {
    var headerDate: String?
    var title = [String?]()
    var contents = [String?]()
    
    init(title: String, contents: String) {
        self.headerDate = CurrentDate.shared.currentDate()
        self.title.append(title)
        self.contents.append(contents)
    }
}
