//
//  ViewController.swift
//  TestDynamicAutoLayout
//
//  Created by hyeoktae kwon on 16/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let btn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Create New Workspace", for: .normal)
        btn.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(toNext(_:)), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(btn)
        autoLayout()
    }
    
    @objc func toNext(_ sender: UIButton) {
        let vc = SecondVC()
        let navi = UINavigationController(rootViewController: vc)
        present(navi, animated: true)
    }
    
    func autoLayout() {
        btn.layout.centerX().centerY()
    }
    
    
}

