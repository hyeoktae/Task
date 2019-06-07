//
//  MainViewController.swift
//  190607 과제
//
//  Created by hyeoktae kwon on 2019/06/07.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view = MainView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Networking.shared.download("fuck") {
            $0 ? print("images count: ", Networking.shared.images.count) : print("error")
        }
    }
    
    
}
