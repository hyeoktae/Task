//
//  ViewController.swift
//  20190409 up's과제
//
//  Created by hyeoktae kwon on 09/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {
    
    @objc var button = UIButton()
    var currentColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = currentColor
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        creatButton()
    }
    
    func creatButton() {
        let safeX = view.safeAreaInsets.left + view.safeAreaInsets.right
        let x = view.frame.width/2 - safeX
        let safeY = view.safeAreaInsets.top + view.safeAreaInsets.bottom
        let y = view.frame.height/2 - safeY
        button.frame = CGRect(x: x-100, y: y, width: 200, height: 80)
        button.setTitle("Alert", for: .normal)
        button.backgroundColor = .lightGray
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(toSecondVC), for: .touchUpInside)
        button.layer.cornerRadius = 40
        view.addSubview(button)
    }
    
    @objc func toSecondVC() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondVC = storyBoard.instantiateViewController(withIdentifier: "secondVC") as? SecondVC else {
            return
        }
        secondVC.delegate = self
        secondVC.modalPresentationStyle = .overCurrentContext
        present(secondVC, animated: true)
        
    }
    
    @IBAction func unwindToFirstVC(_ unwindSegue: UIStoryboardSegue) {
        
    }
}


extension FirstVC: SecondVCDelegate {
    func sendColor(_ color: UIColor) {
        currentColor = color
        view.backgroundColor = currentColor
    }
}

