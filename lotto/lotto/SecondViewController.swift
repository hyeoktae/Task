//
//  SecondViewController.swift
//  lotto
//
//  Created by 차수연 on 03/04/2019.
//  Copyright © 2019 차수연. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var lottoNumber1 = ""
    var lottoNumber2 = ""
    var lottoNumber3 = ""
    var sNum1 = 0
    var sNum2 = 0
    var sNum3 = 0
    
    var gradeCount = 0
    
    var numbers: Set<Int> = [] //중복되지 않는 값 저장
    var result: [Int] = [] //결과 저장 배열
    
    @IBOutlet weak var num1Label: UILabel!
    @IBOutlet weak var num2Label: UILabel!
    @IBOutlet weak var num3Label: UILabel!
    @IBOutlet weak var selectedNum1: UILabel!
    @IBOutlet weak var selectedNum2: UILabel!
    @IBOutlet weak var selectedNum3: UILabel!
    @IBOutlet weak var gradeView: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runRandom()
        updateNumbers()
        viewGrade()
        
    }
    
    func runRandom() {
        numbers = []
        while numbers.count < 3 {
            let number = Int.random(in: 1 ... 9)
            numbers.insert(number)
        }
        result = [Int](numbers)
        num1Label.text = String(result[0]) //num1Label에 첫번째 수 저장
        num2Label.text = String(result[1])//num2Label에 두번째 수 저장
        num3Label.text = String(result[2])//num3Label에 세번째 수 저장
        saveNumbers(result[0],result[1],result[2])
    }
    
    func saveNumbers(_ n1:Int,_ n2:Int,_ n3:Int) {
        saveCellRow()
        let check: Int = UserDefaults.standard.integer(forKey: "Row")
        var NumbersArray: [Int] = []
        NumbersArray.append(n1)
        NumbersArray.append(n2)
        NumbersArray.append(n3)
        NumbersArray.append(sNum1)
        NumbersArray.append(sNum2)
        NumbersArray.append(sNum3)
        
        UserDefaults.standard.set(NumbersArray, forKey: String(check))
        checkNumbers()
    }
    
    func saveCellRow() {
        let check: Int = UserDefaults.standard.integer(forKey: "Row")
        var row: Int = 0
        if check == 0 {
            UserDefaults.standard.set(1, forKey: "Row")
            print("if 0: ", UserDefaults.standard.integer(forKey: "Row"))
        } else {
            row = check + 1
            UserDefaults.standard.set(row, forKey: "Row")
            print("if over 1: ", UserDefaults.standard.integer(forKey: "Row"))
        }
    }
    
    func checkNumbers() {
        let numbers2 = UserDefaults.standard.object(forKey: String(UserDefaults.standard.integer(forKey: "Row")))
        let resultSelect: [Int] = (numbers2) as? [Int] ?? []
        
        if result.contains(resultSelect[3]) {
            gradeCount += 1
        }
        if result.contains(resultSelect[4]) {
            gradeCount += 1
        }
        if result.contains(resultSelect[5]) {
            gradeCount += 1
        }
    }
    
    func updateNumbers() {
        selectedNum1.text = String(sNum1)
        selectedNum2.text = String(sNum2)
        selectedNum3.text = String(sNum3)
    }
    
    func viewGrade() {
        switch gradeCount {
        case 0:
            gradeView.text = "꽝"
        case 1:
            gradeView.text = "3등"
        case 2:
            gradeView.text = "2등"
        case 3:
            gradeView.text = "1등"
        default:
            return
        }
    }
}
