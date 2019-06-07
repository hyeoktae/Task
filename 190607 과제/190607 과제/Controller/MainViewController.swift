//
//  MainViewController.swift
//  190607 과제
//
//  Created by hyeoktae kwon on 2019/06/07.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    
    private lazy var mainView: MainView = {
        let view = MainView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Networking.shared.download("fuck") {
            DispatchQueue.main.sync {
                self.autoLayout()
            }
            self.mainView.reload()
        }
    }
    
    private func autoLayout() {
        view.addSubview(mainView)
        
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
}
