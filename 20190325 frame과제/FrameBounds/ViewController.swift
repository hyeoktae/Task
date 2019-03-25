//
//  ViewController.swift
//  FrameBounds
//
//  Created by hyeoktae kwon on 25/03/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var blueView: UIView = UIView()
    var greenView: UIView = UIView()
    var redView: UIView = UIView()
    var width: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blueView.frame = CGRect(x: 30, y: 30, width: view.frame.width - 60, height: view.frame.height - 60)
        greenView.frame = CGRect(x: 30, y: 30, width: blueView.frame.width - 60, height: blueView.frame.height - 60)
        redView.frame = CGRect(x: 30, y: 30, width: greenView.frame.width - 60, height: greenView.frame.height - 60)
        blueView.backgroundColor = .blue
        greenView.backgroundColor = .green
        redView.backgroundColor = .red
        view.addSubview(blueView)
        blueView.addSubview(greenView)
        greenView.addSubview(redView)
        greenView.layer.cornerRadius = 10
        redView.layer.cornerRadius = 10
        blueView.layer.cornerRadius = 10
    }
}

