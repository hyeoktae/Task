//
//  ViewController.swift
//  lotto
//
//  Created by 차수연 on 03/04/2019.
//  Copyright © 2019 차수연. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var selectedNum1 = ""
    var selectedNum2 = ""
    var selectedNum3 = ""
    
    @IBOutlet weak var textFieldForNum1: UITextField!
    @IBOutlet weak var textFieldForNum2: UITextField!
    @IBOutlet weak var textFieldForNum3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
    
    // 돌리기 버튼 클릭시, 'toSecondVC'라는 Identifier를 가진 segue를 실행
    @IBAction func toSecondVC(_ sender: UIButton) {
        performSegue(withIdentifier: "toSecondVC", sender: self)
    }
    
    // secondVC에 선택된 값들을 전달해준다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let secondVC = segue.destination as? SecondViewController else {
            return
        }
        secondVC.lottoNumber1 = selectedNum1
        secondVC.lottoNumber2 = selectedNum2
        secondVC.lottoNumber3 = selectedNum3
    }
    
    // secondVC의 다시하기 버튼 클릭시 firstVC로 돌아옴과 동시에 textField값들 초기화
    @IBAction func unwindToFirstViewController(_ unwindSegue: UIStoryboardSegue) {
        textFieldForNum1.text = ""
        textFieldForNum2.text = ""
        textFieldForNum3.text = ""
    }
    
    
    
}

