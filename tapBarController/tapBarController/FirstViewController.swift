//
//  ViewController.swift
//  tapBarController
//
//  Created by hyeoktae kwon on 05/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "First VC"
        let naviController = UINavigationController(rootViewController: self)
        naviController
        
        
        let barButton = UIBarButtonItem(title: "Push", style: .done, target: self, action: #selector(pushThirdViewController(_:)))
        navigationItem.rightBarButtonItem = barButton
    }
    
    
    
    
    @objc private func pushThirdViewController(_ sender: Any) {
        let thirdVC = ThridViewController()
        navigationController?.pushViewController(thirdVC, animated: true)
    }


}

