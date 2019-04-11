//
//  CheckAndGrade.swift
//  lotto
//
//  Created by hyeoktae kwon on 12/04/2019.
//  Copyright © 2019 차수연. All rights reserved.
//

import UIKit

class checkNumber {
    var gradeCount = 0
    
    init(label: UILabel?, ForCell: Bool, count: Int?) {
        check(i: count)
        viewGrade(label: label, ForCell: ForCell)
    }
    
    convenience init (count: Int?, ForCell: Bool) {
        self.init(label: nil, ForCell: ForCell, count: count)
    }
    
    convenience init (label: UILabel?, ForCell: Bool) {
        self.init(label: label, ForCell: ForCell, count: nil)
    }
    
    deinit {
        
    }
    
    func check(i: Int?) {
        var randArrayForCheck: [Int] = []
        
        var numbers2: Any?
        
        if let i = i {
            numbers2 = UserDefaults.standard.object(forKey: String(i))
        } else {
            numbers2 = UserDefaults.standard.object(forKey: String(UserDefaults.standard.integer(forKey: "Row"))) }
        
        let resultSelect: [Int] = (numbers2) as? [Int] ?? []
        
        randArrayForCheck.append(resultSelect[0])
        randArrayForCheck.append(resultSelect[1])
        randArrayForCheck.append(resultSelect[2])
        
        Arrays.shared.randArray.append("\(resultSelect[0]) \(resultSelect[1]) \(resultSelect[2])")
        Arrays.shared.selectArray.append("\(resultSelect[3]) \(resultSelect[4]) \(resultSelect[5])")
        
        if randArrayForCheck.contains(resultSelect[3]) {
            gradeCount += 1
        }
        if randArrayForCheck.contains(resultSelect[4]) {
            gradeCount += 1
        }
        if randArrayForCheck.contains(resultSelect[5]) {
            gradeCount += 1
        }
    }
    
    func viewGrade(label: UILabel?, ForCell: Bool) {
        switch self.gradeCount {
        case 0:
            (ForCell) ? (Arrays.shared.grade.append("꽝")) : (label?.text = "꽝")
        case 1:
            (ForCell) ? (Arrays.shared.grade.append("3등")) : (label?.text = "3등")
        case 2:
            (ForCell) ? (Arrays.shared.grade.append("2등")) : (label?.text = "2등")
        case 3:
            (ForCell) ? (Arrays.shared.grade.append("1등")) : (label?.text = "1등")
        default:
            return
        }
    }
}

class Arrays {
    static let shared = Arrays()
    var randArray: [String] = []
    var selectArray: [String] = []
    var grade: [String] = []
    
    func toZero() {
        randArray = []
        selectArray = []
        grade = []
    }
}
