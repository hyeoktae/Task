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
    
    var selectedNum1 = "11"
    var selectedNum2 = "22"
    var selectedNum3 = "33"
    
    @IBOutlet weak var textFieldForNum1: UITextField!
    @IBOutlet weak var textFieldForNum2: UITextField!
    @IBOutlet weak var textFieldForNum3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
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
        
        if (selectedNum1 == selectedNum2) || (selectedNum1 == selectedNum3) || (selectedNum2 == selectedNum3)
        { toZero() }
        
        if (textFieldForNum1.text?.count ?? 0 > 1) || (textFieldForNum2.text?.count ?? 0 > 1) || (textFieldForNum3.text?.count ?? 0 > 1)
        { toZero() }
    }
    
    func toZero() {
        textFieldForNum1.text = ""
        textFieldForNum2.text = ""
        textFieldForNum3.text = ""
        selectedNum1 = "11"
        selectedNum2 = "22"
        selectedNum3 = "33"
    }
    // 아래 위의 함수는 오버로딩을 통해 서로 다른함수
    @IBAction func toZero(_ sender: UIButton) {
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            UserDefaults.standard.removeObject(forKey: key.description)
        }
        print("초기화 완료")
        tableView.reloadData()
    }
    
    @IBAction func toSecondVC(_ sender: UIButton) {
        guard let _ = Int(selectedNum1),
            let _ = Int(selectedNum2),
            let _ = Int(selectedNum3) else {
                print("숫자입력해야함")
                toZero()
                return
        }
        performSegue(withIdentifier: "toSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: self)
        guard let n1 = Int(selectedNum1),
            let n2 = Int(selectedNum2),
            let n3 = Int(selectedNum3),
            let secondVC = segue.destination as? SecondViewController else { return }
        secondVC.sNum1 = n1
        secondVC.sNum2 = n2
        secondVC.sNum3 = n3
    }
    
    @IBAction func unwindToFirstViewController(_ unwindSegue: UIStoryboardSegue) {
        toZero()
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
        
        for i in 1...count {
            _ = checkNumber(count: i, ForCell: true)
        }
        
        cell.num.text = String(indexPath.row+1)
        
        cell.origin.text =
        "로또번호: \(Arrays.shared.randArray[indexPath.row])"
        
        cell.select.text =
        "내 번호: \(Arrays.shared.selectArray[indexPath.row])"
        
        cell.grade.text = Arrays.shared.grade[indexPath.row]
        
        Arrays.shared.toZero()
        
        return cell
    }
}
