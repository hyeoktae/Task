//
//  ViewController.swift
//  20190326 과제
//
//  Created by hyeoktae kwon on 26/03/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//


//[ 과제 ]
//1. 영상 참고
//    > 텍스트 필드에 어떤 값을 입력하면 별도의 Label 에 입력된 텍스트 표시.
//        > 텍스트 필드가 활성화 되어 있을 땐 Label 의 텍스트 색상이 파란색이고, Font 크기는 40
//> 텍스트 필드가 비활성화되면 Label 텍스트 색상이 빨간색이고, Font 크기는 20
//
//2. ViewController 데이터 전달
//> AViewController 와 BViewController 를 만들고 각각 하나의 Label 생성.
//> AViewController 와 BViewController 를 전환할 때마다 각 Label 에 화면을 전환한 숫자 1씩 증가

import UIKit

class FirstViewController: UIViewController {
    
    let VC = SecondViewController()
    let labelForFirstVC = UILabel()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        
        labelForFirstVC.frame = CGRect(x: 100, y: 50, width: view.frame.width - 200, height: 50)
        labelForFirstVC.textColor = .red
        labelForFirstVC.textAlignment = .center
        labelForFirstVC.font = UIFont.boldSystemFont(ofSize: 25)
        labelForFirstVC.text = String(VC.labelNumberForSecond)
        labelForFirstVC.backgroundColor = .white
        view.addSubview(labelForFirstVC)
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 100, y: 150, width: view.frame.width - 200, height: 50)
        button.setTitle("To SecondVC", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(toSecondVC), for: .touchUpInside)
        view.addSubview(button)
        
        
    }

    @objc func toSecondVC(){
        VC.labelNumberForSecond += 1
        present(VC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool)    {
        super.viewWillAppear(animated)
        self.labelForFirstVC.text = String(VC.labelNumberForSecond)
    }
    

}

