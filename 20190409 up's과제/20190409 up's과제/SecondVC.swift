//
//  SecondVC.swift
//  20190409 up's과제
//
//  Created by hyeoktae kwon on 09/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

protocol SecondVCDelegate: class {
    func sendColor(_ color: UIColor)
}

class SecondVC: UIViewController {
    
    weak var delegate: SecondVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeColor(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            delegate?.sendColor(#colorLiteral(red: 0.9989076257, green: 0.7093291879, blue: 0.2986670732, alpha: 1))
        case 2:
            delegate?.sendColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        default:
            break
        }
    }
}
