//
//  ViewController.swift
//  TestFakeSection
//
//  Created by hyeoktae kwon on 01/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var padding:CGFloat = 0
    
    var scrollView: UIScrollView = {
        let s = UIScrollView()
        s.backgroundColor = UIColor.white
        s.translatesAutoresizingMaskIntoConstraints = false
        s.isPagingEnabled = true
        return s
    }()
    
    func autoLayout() {
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive  = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        autoLayout()
        makeLabels()
    }
    
    func makeLabels() {
        for i in 0..<menuDatas.count {
            let header:UILabel = {
                let l = UILabel()
                l.text = menuDatas[i].category
                l.backgroundColor = .lightGray
                l.translatesAutoresizingMaskIntoConstraints = false
                return l
            }()
            scrollView.addSubview(header)
            header.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: padding).isActive = true
            header.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor).isActive = true
            header.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
            header.heightAnchor.constraint(equalToConstant: 40).isActive = true
            header.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
            padding += 40
            for j in 0..<menuDatas[i].products.count {
                
                let label:UILabel = {
                    let l = UILabel()
                    l.text = menuDatas[i].products[j].name
                    l.translatesAutoresizingMaskIntoConstraints = false
                    return l
                }()
                scrollView.addSubview(label)
                label.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: padding).isActive = true
                label.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor).isActive = true
                label.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
                label.heightAnchor.constraint(equalToConstant: 40).isActive = true
                label.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
                padding += 40
                if (i == menuDatas.count-1) && (j == menuDatas[i].products.count-1){
                    label.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
                }
            }
        }
    }
}

