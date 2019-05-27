//
//  TestSuccessLoginVC.swift
//  Omok
//
//  Created by hyeoktae kwon on 28/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class TestSuccessLoginVC: UIViewController {
    
    let label: UILabel = {
        let l = UILabel()
        l.text = "Success Login"
        l.layer.borderWidth = 1
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
}
