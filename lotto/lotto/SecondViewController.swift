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
    
    var count = 0
    
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
        checkNumbers()
        viewGrade()
    }
    
    // 초록색 뷰 안에 라벨에 선택한 값들을 채워 넣음
    func updateNumbers() {
        selectedNum1.text = lottoNumber1
        selectedNum2.text = lottoNumber2
        selectedNum3.text = lottoNumber3
    }
    
    // 랜덤값 3개를 정하여 파란색 뷰 안에 라벨에 값을 채워 넣음
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
    }
    
    // 선택한 값들과 랜덤값들을 비교하여 맞은 개수만큼 count 증가
    func checkNumbers() {
        if result.contains(Int(lottoNumber1) ?? 0) {
            count += 1
        } else if result.contains(Int(lottoNumber2) ?? 0) {
            count += 1
        } else if result.contains(Int(lottoNumber3) ?? 0) {
            count += 1
        }
    }
    
    // count 개수를 판별하여 등수를 나타내는 뷰에 결과값을 출력
    func viewGrade() {
        switch count {
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
