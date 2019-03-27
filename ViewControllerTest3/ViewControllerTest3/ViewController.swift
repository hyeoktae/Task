//
//  ViewController.swift
//  ViewControllerTest3
//
//  Created by hyeoktae kwon on 27/03/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldForID: UITextField!
    
    @IBOutlet weak var textFieldForPW: UITextField!
    
    
    
    @IBAction func buttonForLogin(_ sender: UIButton) {
        guard  let id = textFieldForID.text, !id.isEmpty {
            // 오류처리
            // 사용자에게 아이디가 없습니다 란 경고창 띄우기
            // 함수를 종료
            return
        }
        
        guard  let pw = textFieldForPW.text, !pw.isEmpty {
            // 오류처리
            // 사용자에게 아이디가 없습니다 란 경고창 띄우기
            // 함수를 종료
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

