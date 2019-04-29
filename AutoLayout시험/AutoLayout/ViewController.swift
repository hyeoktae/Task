//
//  ViewController.swift
//  AutoLayout
//
//  Created by hyeoktae kwon on 26/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var carrotView: UIView!
    var skyView: UIView = {
        let skyView = UIView()
        skyView.translatesAutoresizingMaskIntoConstraints = false
        return skyView
    }()
    var blueView = UIView()
    var label = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeVIew()
        // Do any additional setup after loading the view.
    }

    func makeVIew() {
        view.addSubview(skyView)
        view.addSubview(blueView)
        view.addSubview(label)
        
        
        skyView.backgroundColor = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
        skyView.translatesAutoresizingMaskIntoConstraints = false
        skyView.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        skyView.leadingAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        skyView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        skyView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        skyView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        skyView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        
        blueView.backgroundColor = .blue
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.centerXAnchor.constraint(equalTo: skyView.centerXAnchor).isActive = true
        blueView.centerYAnchor.constraint(equalTo: skyView.centerYAnchor).isActive = true
        blueView.widthAnchor.constraint(equalTo: skyView.widthAnchor, multiplier: 0.5).isActive = true
        blueView.heightAnchor.constraint(equalTo: skyView.heightAnchor, multiplier: 0.5).isActive = true
    
        
        label.text = "네번째 문제"
        label.font = label.font.withSize(23)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.centerYAnchor.constraint(equalTo: blueView.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: blueView.centerXAnchor, constant: 20).isActive = true
        label.widthAnchor.constraint(greaterThanOrEqualTo: blueView.widthAnchor, multiplier: 0.7).isActive = true
    }
}

