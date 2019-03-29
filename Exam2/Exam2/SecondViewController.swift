//
//  SecondViewController.swift
//  Exam2
//
//  Created by hyeoktae kwon on 29/03/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var labelForPW: UILabel = UILabel()
    var dismissButton: UIButton = UIButton()
    var passwordForSecondVC: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        creatLabelForPW()
        creatDismissButton()

    }
    
    func creatLabelForPW() {
        labelForPW.frame = CGRect(x: 20, y: 70, width: 150, height: 50)
        labelForPW.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        labelForPW.text = passwordForSecondVC
        view.addSubview(labelForPW)
    }
    
    func creatDismissButton() {
        dismissButton.frame = CGRect(x: 50, y: 150, width: 150, height: 50)
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .normal)
        dismissButton.addTarget(self, action: #selector(backToFirstVC), for: .touchUpInside)
        view.addSubview(dismissButton)
    }
    
    @objc func backToFirstVC() {
        presentingViewController?.dismiss(animated: true)
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
