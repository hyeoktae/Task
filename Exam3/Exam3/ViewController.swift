//
//  ViewController.swift
//  Exam3
//
//  Created by hyeoktae kwon on 29/03/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var code: CodeView = CodeView()
    var zza: Int = 0
    var zzam: Int = 0
    var tangsu: Int = 0
    var totalMoney: Int = 0
    var myFirstMoney: Int = 70000
    
    
    @IBOutlet weak var zzazang: UILabel!
    @IBOutlet weak var zzambbong: UILabel!
    @IBOutlet weak var tang: UILabel!
    
    @IBAction func buttonForStory(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            zza += 1
            zzazang.text = String(zza)
            totalMoney += 5000
            code.willUseMoneyForWon.text = String(totalMoney) + "원"
        case 2:
            zzam += 1
            zzambbong.text = String(zzam)
            totalMoney += 6000
            code.willUseMoneyForWon.text = String(totalMoney) + "원"
        case 3:
            tangsu += 1
            tang.text = String(tangsu)
            totalMoney += 12000
            code.willUseMoneyForWon.text = String(totalMoney) + "원"
        default :
            break
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatCodeView()
    }
    
    func creatCodeView() {
        code.frame = CGRect(x: 0, y: 310, width: view.frame.width, height: view.frame.height - 310)
        view.addSubview(code)
        code.payMoney.addTarget(self, action: #selector(alerts), for: .touchUpInside)
        code.toZero.addTarget(self, action: #selector(toFirst(_:)), for: .touchUpInside)
        code.myMoneyForWon.text = String(myFirstMoney) + "원"
    }
    
    
    
    @objc func alerts(_ sender: UIButton) {
        
        if sender.tag == 5 {
            let alertController = UIAlertController(title: "진짜 사실?", message: "결제금액: \(totalMoney)", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "진짜 삼", style: .default) { (_) in
                self.pay()
            }
            let cancelAction = UIAlertAction(title: "안사", style: .default) { (_) in
            }
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            present(alertController, animated: true)
        }
    }
    
    func pay() {
        guard myFirstMoney < totalMoney else {
            myFirstMoney -= totalMoney
            
            zza = 0
            zzam = 0
            tangsu = 0
            totalMoney = 0
            
            code.myMoneyForWon.text = String(myFirstMoney) + "원"
            code.willUseMoneyForWon.text = String(totalMoney) + "원"
            zzazang.text = String(zza)
            zzambbong.text = String(zzam)
            tang.text = String(tangsu)
            return
        }
    }
    
    @objc func toFirst(_ sender: UIButton) {
        if sender.tag == 4{
            zza = 0
            zzam = 0
            tangsu = 0
            totalMoney = 0
            myFirstMoney = 70000
            
            code.willUseMoneyForWon.text = String(totalMoney) + "원"
            code.myMoneyForWon.text = String(myFirstMoney) + "원"
            zzazang.text = String(zza)
            zzambbong.text = String(zzam)
            tang.text = String(tangsu)
        }
    }
}

