//
//  SecondViewController.swift
//  20190404 과제
//
//  Created by hyeoktae kwon on 04/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate: class {
    func workHasan2()-> String
}

class SecondViewController: UIViewController {
    
    var textForSecondVC = ""
    
    weak var delegate: SecondViewControllerDelegate?
    
    @IBOutlet var useUserDefaultsLabel: UILabel!
    @IBOutlet var useSingletonLabel: UILabel!
    @IBOutlet weak var useDelegate: CustomLable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        useDelegate.delegate = self
        useDelegate.text = delegate?.workHasan2()
        appearUserDefault()
        appearSingleton()
//        useDelegate.text = textForSecondVC
        
    }
    
    
    
    // use UserDefault
    func appearUserDefault() {
        guard let text = UserDefaults.standard.object(forKey: "UserDefaults") as? String else {
            return
        }
        if text != "" {
            useUserDefaultsLabel.text = text
        } else {
            useUserDefaultsLabel.text = "nothing"
        }
    }
    
    // use Singleton
    func appearSingleton() {
        let text = UseSingleton.singletonText.text
        if text != "" {
            useSingletonLabel.text = text
        } else {
            useSingletonLabel.text = "nothing"
        }
    }
    
    
}


extension SecondViewController: CustomLabelDelegate {
    func workHasan(_ text: String?) -> String? {
        print(text)
        
        return text
    }
    
    
    
}
