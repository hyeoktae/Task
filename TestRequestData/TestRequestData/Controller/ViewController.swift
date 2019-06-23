//
//  ViewController.swift
//  TestRequestData
//
//  Created by hyeoktae kwon on 2019/06/23.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let baseView = Bundle.main.loadNibNamed("BaseView", owner:self, options:nil)?.first as! BaseView
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(baseView)
    }


}

