//
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 17/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    var left: Double? = nil
    
    var result = Double() {
        didSet{
            DisplayLabel.text = "\(result)"
        }
    }
    var right: Double? = nil
    var input: String = ""
    var oper = checkOper.none
    var flag = true
    var flagEql = false
    var flagReset = false
    
    
    @IBOutlet weak var DisplayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        if flagReset {
            toZero()
        }
        input = input + "\(sender.tag)"
        print(sender.tag)
        DisplayLabel.text = "\(Double(input)!)"
        flagEql = false
        
    }
    
    func insert() {
        if flag {
            left = Double(input)!
            right = nil
        } else {
            right = Double(input) ?? nil
        }
        input = ""
        flag = false
        print("in insert -> left: ", left, "right: ", right)
    }
    
    @IBAction func oprators(_ sender: UIButton) {
        flagReset = false
        
        insert()
        work(oper, left, right)
        switch sender.tag {
        case 11:
            oper = .add
        case 12:
            oper = .sub
        case 13:
            oper = .mul
        case 14:
            oper = .div
        default:
            return
        }
        
    }
    
    @IBAction func equl(_ sender: UIButton) {
        flagReset = true
        
        if !flagEql {
            insert()
        switch oper {
        case .add:
            right = (right == nil) ? left! : right
            result = right! + left!
            left = result
            right = nil
        case .sub:
            right = (right == nil) ? left! : right
            result = left! - right!
            left = result
            right = nil
        case .mul:
            right = (right == nil) ? left! : right
            result = right! * left!
            left = result
            right = nil
        case .div:
            right = (right == nil) ? left! : right
            result = left! / right!
            left = result
            right = nil
        default:
            ()
        }
            flagEql = true
        }
        print("in Eql -> left: ", left, "right: ", right)
    }
    
    func work(_ oper: checkOper, _ check1: Double?, _ check2: Double?) {
        if check1 != nil && check2 != nil {
            switch oper {
            case .add:
                result = (right == nil) ? left! : (left!+right!)
                left = result
                right = nil
            case .sub:
                result = (right == nil) ? left! : (left!-right!)
                left = result
                right = nil
            case .mul:
                result = (right == nil) ? left! : (left!*right!)
                left = result
                right = nil
            case .div:
                result = (right == nil) ? left! : (left!/right!)
                left = result
                right = nil
            default:
                ()
            }
        }
        print("in oper -> left: ", left, "right: ", right)
    }
    
    
    @IBAction func toZeroButton(_ sender: UIButton) {
        switch sender.tag {
        case 16:
            toZero()
        default:
            break
        }
    }
    
    func toZero() {
        DisplayLabel.text = "0"
        input = ""
        oper = .none
        flag = true
        left = nil
        right = nil
        flagEql = false
        flagReset = false
    }
    
}
