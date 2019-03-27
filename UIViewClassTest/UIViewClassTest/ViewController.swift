//
//  ViewController.swift
//  UIViewClassTest
//
//  Created by hyeoktae kwon on 27/03/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import SafariServices
import WebKit

class ViewController: UIViewController {
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var vayne: SampleView = SampleView()
    var urlView: UIView = UIView()
    var second: SecondViewController = SecondViewController()
    var webView: UIWebView! = UIWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createVayne()
        view.addSubview(webView)
        
    }
    
    
    
    
    func createVayne() {
        vayne.frame = CGRect(x: 20, y: 50, width: 120, height: 150)
        vayne.champButton.setImage(#imageLiteral(resourceName: "베인"), for: .normal)
        
        vayne.nameLabel.text = "Vayne"
        vayne.nameLabel.textColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        self.view.addSubview(vayne)
        vayne.champButton.addTarget(self, action: #selector(urlConnect), for: .touchUpOutside)
    }
    
    @objc func urlConnect(_ sender: UIButton) {
        let url = URL(string: "https://www.google.com")
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            //If you want handle the completion block than
            UIApplication.shared.open(url!, options: [:], completionHandler: { (success) in
                print("Open url : \(success)")
            })
        }
        
        webView.frame = CGRect(x: 0, y: 300, width: view.frame.width - 20, height: view.frame.height - 20)
        view.addSubview(webView)
        
    }
    
    
}

