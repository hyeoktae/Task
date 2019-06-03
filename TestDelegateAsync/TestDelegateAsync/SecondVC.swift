//
//  SecondVC.swift
//  TestDelegateAsync
//
//  Created by hyeoktae kwon on 02/06/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}


extension SecondVC: ViewDelegate {
    func test() -> String {
        return "result"
    }
    
    
}
