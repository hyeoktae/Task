//
//  ViewController.swift
//  TestDelegateAsync
//
//  Created by hyeoktae kwon on 02/06/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

protocol ViewDelegate {
    func test() -> String
}

class ViewController: UIViewController {
    
    var delegate: ViewDelegate?

    var testee: Bool = false {
        didSet {
            print("Result")
        }
    }
    
    let secondVC = SecondVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = secondVC
        print("before")
//        Thread.sleep(forTimeInterval: 0.5)
//        DispatchQueue.main.async {
//
//            print(self.delegate?.test())
//        }
        
        testee = true
        print("after")
        
    }


}

