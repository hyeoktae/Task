//
//  ViewController.swift
//  20190404  up's과제
//
//  Created by hyeoktae kwon on 06/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    let redModule = ColorModule(frame: CGRect(x: 30, y: 50, width: 200, height: 80), colorText: "Red", color: #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), tag: 1)
    let greenModule = ColorModule(frame: CGRect(x: 30, y: 210, width: 200, height: 80), colorText: "Green", color: #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1), tag: 2)
    let blueModule = ColorModule(frame: CGRect(x: 30, y: 370, width: 200, height: 80), colorText: "Blue", color: #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1), tag: 3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatModules()
        creatButton()
    }
    
    func creatModules() {
        redModule.slider.addTarget(self, action: #selector(changeValue), for: .valueChanged)
        greenModule.slider.addTarget(self, action: #selector(changeValue), for: .valueChanged)
        blueModule.slider.addTarget(self, action: #selector(changeValue), for: .valueChanged)
        view.addSubview(redModule)
        view.addSubview(greenModule)
        view.addSubview(blueModule)
    }
    
    @objc func changeValue(_ sender: UISlider) {
        switch sender.tag {
        case 1:
            Red.red.red = CGFloat(sender.value)
        case 2:
            Green.green.green = CGFloat(sender.value)
        case 3:
            Blue.blue.blue = CGFloat(sender.value)
        default:
            break
        }
    }
    
    func creatButton() {
        let next = UIButton()
        next.frame = CGRect(x: 30, y: 600, width: 100, height: 80)
        next.setTitle("Next", for: .normal)
        next.backgroundColor = .gray
        next.addTarget(self, action: #selector(goNext(_:)), for: .touchUpInside)
        view.addSubview(next)
    }
    
    @objc func goNext(_ sender: UIButton) {
        let secondVC = SecondViewController()
        present(secondVC, animated: true)
    }
    
    


}

