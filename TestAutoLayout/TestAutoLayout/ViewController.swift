//
//  ViewController.swift
//  TestAutoLayout
//
//  Created by hyeoktae kwon on 25/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var scrollView = UIScrollView()
    
    var leftHugeView = UIView()
    var rightHugeView = UIView()
    var leftBigView = UIView()
    var rightBigView = UIView()
    var leftView = UIView()
    var rightView = UIView()
    var upView = UIView()
    var downView = UIView()
    var button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        makeViews()
    }
    
    func makeViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(leftHugeView)
        scrollView.addSubview(rightHugeView)
        scrollView.addSubview(leftBigView)
        scrollView.addSubview(rightBigView)
        scrollView.addSubview(leftView)
        scrollView.addSubview(rightView)
        scrollView.addSubview(upView)
        scrollView.addSubview(downView)
        scrollView.addSubview(button)
        //AutoLayout
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        
        leftHugeView.backgroundColor = .blue
        leftHugeView.translatesAutoresizingMaskIntoConstraints = false
        leftHugeView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        leftHugeView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        leftHugeView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        leftHugeView.trailingAnchor.constraint(equalTo: rightHugeView.leadingAnchor, constant: 0).isActive = true
        leftHugeView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        leftHugeView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        
        rightHugeView.backgroundColor = .green
        rightHugeView.translatesAutoresizingMaskIntoConstraints = false
        rightHugeView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        rightHugeView.leadingAnchor.constraint(equalTo: leftHugeView.trailingAnchor, constant: 0).isActive = true
        rightHugeView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        rightHugeView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        rightHugeView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        rightHugeView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        
        leftBigView.backgroundColor = .red
        leftBigView.translatesAutoresizingMaskIntoConstraints = false
        leftBigView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        leftBigView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        leftBigView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20).isActive = true
        leftBigView.trailingAnchor.constraint(equalTo: rightBigView.leadingAnchor, constant: 0).isActive = true
        leftBigView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        leftBigView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -40).isActive = true
        
        
        rightBigView.backgroundColor = .gray
        rightBigView.translatesAutoresizingMaskIntoConstraints = false
        rightBigView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        rightBigView.leadingAnchor.constraint(equalTo: leftBigView.trailingAnchor, constant: 0).isActive = true
        rightBigView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20).isActive = true
        rightBigView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 20).isActive = true
        rightBigView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        rightBigView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -40).isActive = true
        
        
        leftView.backgroundColor = .black
        leftView.translatesAutoresizingMaskIntoConstraints = false
        leftView.topAnchor.constraint(equalTo: leftBigView.topAnchor, constant: 20).isActive = true
        leftView.leadingAnchor.constraint(equalTo: leftBigView.leadingAnchor, constant: 20).isActive = true
        leftView.bottomAnchor.constraint(equalTo: leftBigView.bottomAnchor, constant: -20).isActive = true
        leftView.trailingAnchor.constraint(equalTo: rightView.leadingAnchor, constant: -20).isActive = true
        leftView.widthAnchor.constraint(equalTo: rightView.widthAnchor).isActive = true
        leftView.heightAnchor.constraint(equalTo: rightView.heightAnchor).isActive = true
        
        
        rightView.backgroundColor = .white
        rightView.translatesAutoresizingMaskIntoConstraints = false
        rightView.topAnchor.constraint(equalTo: leftBigView.topAnchor, constant: 20).isActive = true
        rightView.leadingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: 20).isActive = true
        rightView.bottomAnchor.constraint(equalTo: leftBigView.bottomAnchor, constant: -20).isActive = true
        rightView.trailingAnchor.constraint(equalTo: leftBigView.trailingAnchor, constant: -20).isActive = true
        rightView.widthAnchor.constraint(equalTo: leftView.widthAnchor).isActive = true
        rightView.heightAnchor.constraint(equalTo: leftView.heightAnchor).isActive = true
        
        
        upView.backgroundColor = .white
        upView.translatesAutoresizingMaskIntoConstraints = false
        upView.topAnchor.constraint(equalTo: rightBigView.topAnchor, constant: 20).isActive = true
        upView.leadingAnchor.constraint(equalTo: rightBigView.leadingAnchor, constant: 20).isActive = true
        upView.bottomAnchor.constraint(equalTo: downView.topAnchor, constant: -20).isActive = true
        upView.trailingAnchor.constraint(equalTo: rightBigView.trailingAnchor, constant: -20).isActive = true
        upView.widthAnchor.constraint(equalTo: downView.widthAnchor).isActive = true
        upView.heightAnchor.constraint(equalTo: downView.heightAnchor).isActive = true
        
        
        downView.backgroundColor = .white
        downView.translatesAutoresizingMaskIntoConstraints = false
        downView.topAnchor.constraint(equalTo: upView.bottomAnchor, constant: 20).isActive = true
        downView.leadingAnchor.constraint(equalTo: rightBigView.leadingAnchor, constant: 20).isActive = true
        downView.bottomAnchor.constraint(equalTo: rightBigView.bottomAnchor, constant: -20).isActive = true
        downView.trailingAnchor.constraint(equalTo: rightBigView.trailingAnchor, constant: -20).isActive = true
        downView.widthAnchor.constraint(equalTo: upView.widthAnchor).isActive = true
        downView.heightAnchor.constraint(equalTo: upView.heightAnchor).isActive = true
        
        
        button.setTitle("Button", for: .normal)
        button.backgroundColor = .yellow
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: rightView.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: rightView.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: rightView.heightAnchor, multiplier: 0.1).isActive = true
        button.widthAnchor.constraint(equalTo: rightView.widthAnchor, multiplier: 0.5).isActive = true
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
}
