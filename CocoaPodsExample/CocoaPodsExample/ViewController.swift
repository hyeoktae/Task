//
//  ViewController.swift
//  CocoaPodsExample
//
//  Created by hyeoktae kwon on 31/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    let test = UILabel().then {
        $0.text = "WOW"
        $0.backgroundColor = .white
        
    }
    
    let bottomCircleView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        snapkitExample()
        view.addSubview(test)
        
        test.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bottomCircleView.layer.cornerRadius = bottomCircleView.frame.width / 2
    }
    
    func snapkitExample() {
        let squareView = UIView()
        squareView.backgroundColor = .green
        view.addSubview(squareView)
        
        let topView = UIView()
        topView.backgroundColor = .black
        squareView.addSubview(topView)
        
        let topLabel = UILabel()
        topLabel.text = "TopView"
        topLabel.textColor = .white
        topLabel.textAlignment = .center
        topLabel.font = UIFont.boldSystemFont(ofSize: 25)
        topView.addSubview(topLabel)
        
        let bottomView = UIView()
        bottomView.backgroundColor = .red
        squareView.addSubview(bottomView)
        
        let bottomLabel = UILabel()
        bottomLabel.text = "BottomView"
        bottomLabel.textColor = .white
        bottomLabel.textAlignment = .center
        bottomLabel.font = UIFont.boldSystemFont(ofSize: 25)
        bottomView.addSubview(bottomLabel)
        
        bottomCircleView.backgroundColor = .cyan
        view.addSubview(bottomCircleView)
        
        // Setup Constraints
        squareView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-40)
            $0.width.equalToSuperview().multipliedBy(0.7)
            $0.height.equalToSuperview().multipliedBy(0.4)
        }
        
        topView.snp.makeConstraints {
            $0.top.trailing.leading.equalToSuperview().inset(20)
        }
        
        bottomView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom)
            $0.height.equalTo(topView)
            $0.leading.bottom.trailing.equalToSuperview().inset(20)
        }
        
        topLabel.snp.makeConstraints {
//            $0.top.leading.bottom.trailing.equalToSuperview()
            $0.edges.equalToSuperview()
        }
        
        bottomLabel.snp.makeConstraints {
            //            $0.top.leading.bottom.trailing.equalToSuperview()
            $0.width.height.equalTo(topLabel)
            $0.leading.bottom.equalToSuperview()
        }
        
        bottomCircleView.snp.makeConstraints {
            $0.top.equalTo(squareView.snp.bottom)
            $0.centerX.equalTo(squareView)
            $0.width.height.equalTo(squareView.snp.width).dividedBy(2)
        }
    }


}

