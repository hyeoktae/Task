//
//  SecondViewController.swift
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



class SecondViewController: UIViewController {

    var labelNumberForSecond: Int = 0
    let labelForSecondVC = UILabel()
    let labelForCopy = UILabel()
    let textField = UITextField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        
        textField.frame = CGRect(x: 100, y: 350, width: view.frame.width - 200, height: 50)
        textField.textAlignment = .center
//        textField.textColor = .red
//        textField.font = UIFont.boldSystemFont(ofSize: 25)
        textField.backgroundColor = .white
        textField.placeholder = "입력하세요~"
        textField.clearButtonMode = .whileEditing
        textField.enablesReturnKeyAutomatically = true
        view.addSubview(textField)
        
        // 아래꺼 중요! 코드로만 작성할때, @IBAction 기능 사용할때 이거 사용
        textField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        textField.addTarget(self, action: #selector(editingDidBegin(_:)), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(editingDidEnd(_:)), for: .editingDidEnd)
        textField.addTarget(self, action: #selector(onExit), for: .editingDidEndOnExit)
        
        labelForCopy.frame = CGRect(x: 100, y: 250, width: view.frame.width - 200, height: 50)
        labelForCopy.textColor = .red
        labelForCopy.textAlignment = .center
        labelForCopy.font = UIFont.boldSystemFont(ofSize: 20)
        labelForCopy.backgroundColor = .white
        view.addSubview(labelForCopy)
        
        labelForSecondVC.frame = CGRect(x: 100, y: 50, width: view.frame.width - 200, height: 50)
        labelForSecondVC.textColor = .red
        labelForSecondVC.textAlignment = .center
        labelForSecondVC.font = UIFont.boldSystemFont(ofSize: 25)
        labelForSecondVC.backgroundColor = .white
        view.addSubview(labelForSecondVC)
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 100, y: 150, width: view.frame.width - 200, height: 50)
        button.setTitle("To FirstVC", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(toFirstVC), for: .touchUpInside)
        view.addSubview(button)
        
        
    }
    
    @objc func editingDidEnd(_ sender: UITextField){
        labelForCopy.font = UIFont.boldSystemFont(ofSize: 20)
        labelForCopy.textColor = .red
    }
    
    
    @objc func editingDidBegin(_ sender: UITextField){
        labelForCopy.font = UIFont.boldSystemFont(ofSize: 40)
        labelForCopy.textColor = .blue
    }
    
    @objc func editingChanged(_ sender: UITextField){
        if let abc = sender.text{
            labelForCopy.text = abc
        }
    }
    
    @objc func onExit() {
        
    }
    
    @objc func toFirstVC(){
        labelNumberForSecond += 1
        presentingViewController?.dismiss(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool)    {
        super.viewWillAppear(animated)
        self.labelForSecondVC.text = String(self.labelNumberForSecond)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textField.becomeFirstResponder()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
