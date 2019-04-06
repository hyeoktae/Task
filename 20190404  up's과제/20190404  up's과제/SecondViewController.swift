//
//  SecondViewController.swift
//  20190404  up's과제
//
//  Created by hyeoktae kwon on 06/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        creatButton()
        
        view.backgroundColor = .init(red: Red.red.red, green: Green.green.green, blue: Blue.blue.blue, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    func creatButton() {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.backgroundColor = .gray
        button.frame = CGRect(x: view.frame.width/2, y: view.frame.height/2, width: 100, height: 80)
        button.addTarget(self, action: #selector(goBack(_:)), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func goBack(_ sender: UIButton) {
        dismiss(animated: true)
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
