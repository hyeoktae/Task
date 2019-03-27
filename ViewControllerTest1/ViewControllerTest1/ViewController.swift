//
//  ViewController.swift
//  ViewControllerTest1
//
//  Created by hyeoktae kwon on 27/03/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var orange: UIView = UIView()
    var red: UIView = UIView()
    var green: UIView = UIView()
    var blue: UIView = UIView()
    var yellow: UIView = UIView()
    var purple: UIView = UIView()
    var purple2: UIView = UIView()
    var lightGray: UIView = UIView()
    
    let padding: CGFloat = 5
    
    
    
    func displayLightGray(){
        lightGray.frame = CGRect(x: 10, y: 10, width: view.frame.width - 20, height: 100)
        lightGray.backgroundColor = .lightGray
        view.addSubview(lightGray)
    }
    
    func displayYellow(){
        yellow.frame = CGRect(x: padding, y: padding, width: 100, height: lightGray.frame.height - 10)
        yellow.backgroundColor = .yellow
        lightGray.addSubview(yellow)
    }
    
    func displayPurple(){
        purple.frame = CGRect(x: yellow.frame.width + 10, y: padding, width: lightGray.frame.width - yellow.frame.width - 15, height: (lightGray.frame.height - 15) / 2)
        purple.backgroundColor = .purple
        lightGray.addSubview(purple)
    }
    
    func displayPurple2(){
        purple2.frame = CGRect(x: yellow.frame.width + 10, y: 10 + purple.frame.height, width: lightGray.frame.width - yellow.frame.width - 15, height: (lightGray.frame.height - 15) / 2)
        purple2.backgroundColor = .purple
        lightGray.addSubview(purple2)
    }
    
    func displayOrange(){
        orange.frame = CGRect(x: 10, y: 20 + lightGray.frame.height, width: view.frame.width - (padding*4), height: view.frame.height - lightGray.frame.height - (padding*6))
        orange.backgroundColor = .orange
        view.addSubview(orange)
    }
    
    func dispalyRed(){
        red.frame = CGRect(x: padding, y: padding, width: orange.frame.width - (padding*2), height: orange.frame.height / 3 - (padding*2))
        red.backgroundColor = .red
        orange.addSubview(red)
    }
    
    func dispalyGreen(){
        green.frame = CGRect(x: padding, y: red.frame.height + (padding*2), width: orange.frame.width - (padding*2), height: orange.frame.height / 3 - padding)
        green.backgroundColor = .green
        orange.addSubview(green)
    }
    
    func dispalyBlue(){
        blue.frame = CGRect(x: padding, y: red.frame.height * 2 + (padding*4), width: orange.frame.width - (padding*2), height: orange.frame.height / 3 - padding)
        blue.backgroundColor = .blue
        orange.addSubview(blue)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayLightGray()
        displayYellow()
        displayPurple()
        displayPurple2()
        
        displayOrange()
        dispalyRed()
        dispalyBlue()
        dispalyGreen()
        
        
        
        
    }


}

