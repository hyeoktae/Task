//
//  ViewController.swift
//  20190402 과제2
//
//  Created by hyeoktae kwon on 02/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var countDog = 0
    var countCat = 0
    var countBird = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let dest = segue.destination as? SecondViewController, let id = segue.identifier else { return }
        
        
        if id=="Dog" {
            dest.setImage = #imageLiteral(resourceName: "Dog")
            countDog += 1
            print("set: \(countDog)")
        } else if id=="Bird" {
            dest.setImage = #imageLiteral(resourceName: "Bird")
            countBird += 1
        } else {
            dest.setImage = #imageLiteral(resourceName: "Cat")
            countCat += 1
        }
        print("run A")
        dest.countDog = countDog
        dest.countCat = countCat
        dest.countBird = countBird
        print("Second Dog: \(dest.countDog)")
        print("Second Cat: \(dest.countCat)")
        print("Second Bird: \(dest.countBird)")
    }
    
    
    @IBAction func unwindToFirstViewController(_ unwindSegue: UIStoryboardSegue) {
        
        guard let source = unwindSegue.source as? SecondViewController else {
            return
        }
        countCat = source.countCat
        countDog = source.countDog
        countBird = source.countBird
        print(countDog)
    }

    @IBAction func toDog(_ sender: Any) {
        guard countDog < 8 else { return }
        performSegue(withIdentifier: "Dog", sender: sender)
    }
    
    @IBAction func toCat(_ sender: Any) {
        guard countCat < 10 else { return }
        performSegue(withIdentifier: "Cat", sender: sender)
    }
    
    @IBAction func toBird(_ sender: Any) {
        guard countBird < 15 else {  return }
        performSegue(withIdentifier: "Bird", sender: sender)    }
    
}

