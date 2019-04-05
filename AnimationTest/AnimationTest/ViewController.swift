//
//  ViewController.swift
//  AnimationTest
//
//  Created by hyeoktae kwon on 05/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let someView = UIView()
        someView.frame.size = CGSize(width: 100, height: 100)
        someView.center = view.center
        someView.backgroundColor = .blue
        view.addSubview(someView)
        
        someView.layer.cornerRadius = 10
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
    }


}

