//
//  ViewController.swift
//  NavigationControllerTest
//
//  Created by hyeoktae kwon on 05/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First VC"
        
        if #available(iOS 11.0, *){
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        let barButton = UIBarButtonItem(title: "Push", style: .done, target: self, action: #selector(pushViewController(_:)))
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc private func pushViewController(_ sender: Any) {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
}

