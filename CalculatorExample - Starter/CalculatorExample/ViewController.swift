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
    var right: Double? = nil
    var input: String = ""
    var oper = checkOper.none
    var flag = true
    var flagEql = false
    var flagReset = false
    let formatter = NumberFormatter()
    var resultString: String = ""
    var inputString: String = ""
    var flagNumber = false
    var result = Double() {
        didSet{
            resultString = formatter.string(from: result as NSNumber) ?? ""
            DisplayLabel.text = resultString
        }
    }
    
    @IBOutlet weak var DisplayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 3
    }
    

    
    @IBAction func numbers(_ sender: UIButton) {
        if flagReset {
            toZero()
        }
        input = input + "\(sender.tag)"
        inputString = formatter.string(from: Double(input)! as NSNumber) ?? ""
        DisplayLabel.text = inputString
        flagEql = false
        flagNumber = true
        reset()
    }
    
    func reset() {
        if left == nil && right == nil {
            flag = true
        }
    }
    
    func insert() {
        if flag && flagNumber {
            print("run")
            left = Double(input)!
            right = nil
        } else if !flag && flagNumber {
            right = Double(input) ?? nil
        }
        input = ""
        flag = false
        print("left: ", left ?? 0 , "right: ", right ?? 0)
    }
    
    @IBAction func oprators(_ sender: UIButton) {
        flagReset = false
        insert()
        work(oper, left, right)
        if flagNumber {
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
                break
            }
        }
    }
    
    @IBAction func equl(_ sender: UIButton) {
        flagReset = true
        if !flagEql && flagNumber {
            insert()
            right = (right == nil) ? left! : right
            switch oper {
            case .add:
                result = right! + left!
            case .sub:
                result = left! - right!
            case .mul:
                result = right! * left!
            case .div:
                result = left! / right!
            default:
                break
            }
            flagEql = true
            left = result
            right = nil
        }
    }
    
    func work(_ oper: checkOper, _ check1: Double?, _ check2: Double?) {
        if check1 != nil && check2 != nil {
            switch oper {
            case .add:
                result = (right == nil) ? left! : (left!+right!)
            case .sub:
                result = (right == nil) ? left! : (left!-right!)
            case .mul:
                result = (right == nil) ? left! : (left!*right!)
            case .div:
                result = (right == nil) ? left! : (left!/right!)
            default:
                break
            }
            left = result
            right = nil
        }
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
        flagNumber = false
    }
    
}
