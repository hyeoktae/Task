//
//  ViewController.swift
//  lotto
//
//  Created by 차수연 on 03/04/2019.
//  Copyright © 2019 차수연. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedNum1 = ""
    var selectedNum2 = ""
    var selectedNum3 = ""
    var errorCount = false
    
//    @IBOutlet weak var origin: UILabel!
//    @IBOutlet weak var select: UILabel!
    
    @IBOutlet weak var textFieldForNum1: UITextField!
    @IBOutlet weak var textFieldForNum2: UITextField!
    @IBOutlet weak var textFieldForNum3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.reloadData()
    }
    
    // 여러개의 textField의 값들을 받아서 selectedNums에 저장, tag로 구분지어줌
    @IBAction func textFields(_ sender: UITextField) {
        switch sender.tag {
        case 1:
            selectedNum1 = (textFieldForNum1.text ?? "")
        case 2:
            selectedNum2 = (textFieldForNum2.text ?? "")
        case 3:
            selectedNum3 = (textFieldForNum3.text ?? "")
        default:
            return
        }
        
        if (textFieldForNum1.text?.count ?? 0 > 1) || (textFieldForNum2.text?.count ?? 0 > 1) || (textFieldForNum3.text?.count ?? 0 > 1){
            errorCount = true
            textFieldForNum1.text = ""
            textFieldForNum2.text = ""
            textFieldForNum3.text = ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: self)
        guard let n1 = Int(selectedNum1),
            let n2 = Int(selectedNum2),
            let n3 = Int(selectedNum3),
            let secondVC = segue.destination as? SecondViewController else {
            print("숫자입력해야함")
            return
        }
        secondVC.sNum1 = n1
        secondVC.sNum2 = n2
        secondVC.sNum3 = n3
    }
    
    // 돌리기 버튼 클릭시, 'toSecondVC'라는 Identifier를 가진 segue를 실행
    @IBAction func toSecondVC(_ sender: UIButton) {
        guard let n1 = Int(selectedNum1),
            let n2 = Int(selectedNum2),
            let n3 = Int(selectedNum3) else {
                print("숫자입력해야함")
            return
        }
        performSegue(withIdentifier: "toSecondVC", sender: self)
    }
    @IBAction func unwindToFirstViewController(_ unwindSegue: UIStoryboardSegue) {
        textFieldForNum1.text = ""
        textFieldForNum2.text = ""
        textFieldForNum3.text = ""
        tableView.reloadData()
    }
    
    @IBAction func toZero(_ sender: UIButton) {
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            UserDefaults.standard.removeObject(forKey: key.description)
        }
        print("초기화 완료")
        tableView.reloadData()
    }
}


extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserDefaults.standard.integer(forKey: "Row")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FirstCustomCell
        
        let count = UserDefaults.standard.integer(forKey: "Row")
        
        var randArray: [String] = []
        var selectArray: [String] = []
        var randArrayForCheck: [Int] = []
        var grade: [String] = []
        
        for i in 1...count {
            
            var gradeCount1 = 0
            let numbers2 = UserDefaults.standard.object(forKey: String(i))
            let result: [Int] = (numbers2) as? [Int] ?? []
            
            randArray.append("\(result[0]) \(result[1]) \(result[2])")
            selectArray.append("\(result[3]) \(result[4]) \(result[5])")
            
            randArrayForCheck.append(result[0])
            randArrayForCheck.append(result[1])
            randArrayForCheck.append(result[2])
            
            if randArrayForCheck.contains(result[3]) {
                gradeCount1 += 1
            }
            if randArrayForCheck.contains(result[4]) {
                gradeCount1 += 1
            }
            if randArrayForCheck.contains(result[5]) {
                gradeCount1 += 1
            }
            
            switch gradeCount1 {
            case 0:
                grade.append("꽝")
            case 1:
                grade.append("3등")
            case 2:
                grade.append("2등")
            case 3:
                grade.append("당첨")
            default:
                ()
            }
            gradeCount1 = 0
            randArrayForCheck = []
        }
        
//        let currentRowOfList = "\(randArray[indexPath.row])"
        
        
//        cell.textLabel?.text = String(count)
//        origin.text = "\(randArray[indexPath.row])"
//        select.text = "\(selectArray[indexPath.row])"
//        cell.contentView.addSubview(origin)
//        cell.contentView.addSubview(select)
        
        cell.num.text = String(indexPath.row+1)
        cell.origin.text = "로또번호: \(randArray[indexPath.row])"
        cell.select.text = "내 번호: \(selectArray[indexPath.row])"
        cell.grade.text = grade[indexPath.row]
        
        return cell
    }
}
