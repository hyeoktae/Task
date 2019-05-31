//
//  WaitRoomVC.swift
//  Omok
//
//  Created by hyeoktae kwon on 29/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class WaitRoomVC: UIViewController {
    
    let waitRoomView: WaitRoomView = {
        let view = WaitRoomView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(waitRoomView)
        autoLayout()
    }
    
    private func autoLayout() {
        waitRoomView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        waitRoomView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        waitRoomView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        waitRoomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
