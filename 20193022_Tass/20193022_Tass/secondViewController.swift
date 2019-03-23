//
//  SecondViewController.swift
//  20193022_Tass
//
//  Created by hyeoktae kwon on 22/03/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var calculatorDisplay: UILabel!
    
    var number: Int = 0
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    var result: Int = 0
    var resultForMulti: Int = 1
    var marks: Int = 0
    var markForDiv: Int = 0
    var oper: String = ""
    var labelText: String = ""
    var labelText2: Int = 0
    var firstForMulti: Int = 0
    var firstForSub: Int = 0
    var firstForDiv: Int = 0
    
    @IBOutlet weak var operAdd: UIButton!
    @IBOutlet weak var operSub: UIButton!
    @IBOutlet weak var operMul: UIButton!
    @IBOutlet weak var operDiv: UIButton!
    
    
    @IBAction func numbers(_ sender: UIButton) {
        
        func reduce() {
            number = sender.tag
            
            if marks == 0{
                labelText = labelText + String(sender.tag)
                calculatorDisplay.text = String(Int(labelText)!)
                firstNumber = Int(labelText) ?? 0
                print("숫자를 눌러서 first에 저장")
                print("first의 값: \(firstNumber)")
            } else if marks == 1{
                labelText = labelText + String(sender.tag)
                calculatorDisplay.text = labelText
                firstNumber = Int(labelText) ?? 0
                marks = 0
                print("marks를 0으로 만듬")
                print("숫자를 눌러서 second에 저장")
                print("second의 값: \(secondNumber)")
            }
            
        }
        switch sender.tag {
        case 0:
            reduce()
        case 1:
            reduce()
        case 2:
            reduce()
        case 3:
            reduce()
        case 4:
            reduce()
        case 5:
            reduce()
        case 6:
            reduce()
        case 7:
            reduce()
        case 8:
            reduce()
        case 9:
            reduce()
        default:
            break
        }
    }
    
    
    @IBAction func operators(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            
            if oper == "a"{
                result = result + (firstNumber + secondNumber)
                secondNumber = 0
                firstNumber = 0
                firstForMulti = 1
                firstForSub = 1
                firstForDiv = 1
                print("=했을때의 result값: \(result)")
            } else if oper == "s"{
                result = result - (firstNumber + secondNumber)
                secondNumber = 0
                firstNumber = 0
                firstForMulti = 1
                firstForSub = 1
                firstForDiv = 1
                print("-했을때의 result값: \(result)")
            } else if oper == "m"{
                firstNumber != 0 ? result = result * (firstNumber + secondNumber) : ()
                
                secondNumber = 0
                firstNumber = 0
                firstForMulti = 1
                firstForSub = 1
                firstForDiv = 1
                print("*했을때의 result값: \(result)")
            } else if oper == "d"{
                if firstNumber == 0 && markForDiv == 0 && firstForSub == 0 && firstForMulti == 0 && firstForDiv == 0{
                    calculatorDisplay.text = "error"
                    break
                } else if (firstNumber != 0 && result != 0){
                    result = (firstNumber + secondNumber) / result
                }
                secondNumber = 0
                firstNumber = 0
                firstForMulti = 1
                firstForSub = 1
                firstForDiv = 1
                print("/했을때의 result값: \(result)")
            }
            calculatorDisplay.text = String(result)
            operAdd.isEnabled = true
            operSub.isEnabled = true
            operMul.isEnabled = true
            operDiv.isEnabled = true
            
        case 1:
            result = result + (firstNumber + secondNumber)
            print("+를 눌러서 값확인: \(result)")
            secondNumber = 0
            firstNumber = 0
            calculatorDisplay.text = String(result)
            print("+를 누르고 화면값 변경 \(result)")
            labelText = ""
            marks = 1
            oper = "a"
            firstForMulti = 1
            firstForSub = 1
            firstForDiv = 1
            operSub.isEnabled = false
            operMul.isEnabled = false
            operDiv.isEnabled = false
            
            
            
        case 2:
            if firstForSub == 0 && firstForMulti == 0 && firstForDiv == 0{
                result = firstNumber + secondNumber
            }else if firstForSub == 1{
                result = result - (firstNumber + secondNumber)
            }
            print("-를 눌러서 값확인: \(result)")
            secondNumber = 0
            firstNumber = 0
            calculatorDisplay.text = String(result)
            print("-를 누르고 화면값 변경 \(result)")
            labelText = ""
            marks = 1
            oper = "s"
            firstForSub = 1
            firstForMulti = 1
            firstForDiv = 1
            operAdd.isEnabled = false
            operMul.isEnabled = false
            operDiv.isEnabled = false
            
        case 3:
            print("if 돌리기 전의 값들: \(firstNumber), \(secondNumber)")
            if firstForSub == 0 && firstForMulti == 0 && firstForDiv == 0 {
                result = 1
                } else if firstNumber == 0 && secondNumber == 0 {
                        secondNumber = 1
            }
            print("if 돌린 후의 값들: \(firstNumber), \(secondNumber)")
            result = (secondNumber + firstNumber) * result
            calculatorDisplay.text = String(result)
            print("*를 눌러서 값확인: \(result)")
            secondNumber = 0
            firstNumber = 0
            
            print("*를 누르고 화면값 변경 \(result)")
            labelText = ""
            marks = 1
            oper = "m"
            firstForMulti = 1
            firstForSub = 1
            firstForDiv = 1
            operAdd.isEnabled = false
            operSub.isEnabled = false
            operDiv.isEnabled = false
            
        case 4:
            print("if 돌리기 전의 값들: \(firstNumber), \(secondNumber)")
            
            if firstForSub == 0 && firstForMulti == 0 && firstForDiv == 0 {
                result = 1
            }
            else if firstNumber == 0 && secondNumber == 0 {
                secondNumber = 1
            }
            
            print("if 돌린 후의 값들: \(firstNumber), \(secondNumber)")
            if firstNumber == 0 && markForDiv == 0 && firstForSub == 0 && firstForMulti == 0 && firstForDiv == 0{
                calculatorDisplay.text = "error"
                break
            } else if (firstNumber != 0 && result != 0){
                result = (firstNumber + secondNumber) / result
            }
            calculatorDisplay.text = String(result)
            print("/를 눌러서 값확인: \(result)")
            secondNumber = 0
            firstNumber = 0
            
            print("/를 누르고 화면값 변경 \(result)")
            labelText = ""
            marks = 1
            oper = "d"
            firstForMulti = 1
            firstForSub = 1
            firstForDiv = 1
            markForDiv = 1
            operAdd.isEnabled = false
            operSub.isEnabled = false
            operMul.isEnabled = false
            
        case 5:
            number = 0
            result = 0
            firstNumber = 0
            secondNumber = 0
            marks = 0
            markForDiv = 0
            firstForMulti = 0
            firstForSub = 0
            firstForDiv = 0
            operAdd.isEnabled = true
            operSub.isEnabled = true
            operMul.isEnabled = true
            operDiv.isEnabled = true
            
            labelText = "0"
            calculatorDisplay.text = labelText
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
}
