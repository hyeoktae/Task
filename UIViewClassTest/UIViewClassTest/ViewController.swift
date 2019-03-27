//
//  ViewController.swift
//  UIViewClassTest
//
//  Created by hyeoktae kwon on 27/03/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    var vayne: SampleView = SampleView()
    var urlView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createVayne()
        
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
        
        let url = URL(string: "http://gameinfo.leagueoflegends.co.kr/ko/game-info/champions/vayne/")
        let vc = SFSafariViewController(url: url!)
        
        present(vc, animated: true, completion: nil)
    }
}

