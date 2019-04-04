//
//  ViewController.swift
//  20190404 과제
//
//  Created by hyeoktae kwon on 04/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit



// use Singleton
class UseSingleton {
    static let singletonText = UseSingleton()
//    private init() {}
    var text = ""
}


class FirstViewController: UIViewController {
    
    @IBOutlet var useUserDefaults: UITextField!
    @IBOutlet var useSingleton: UITextField!
    @IBOutlet weak var useDelegate2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // Use UserDefaults
    @IBAction func edittingChanged(_ sender: Any) {
        UserDefaults.standard.set(useUserDefaults.text, forKey: "UserDefaults")
    }
    
    @IBAction func edittingChangedSingleton(_ sender: UITextField) {
        guard let text = useSingleton.text else {
            return
        }
        UseSingleton.singletonText.text = text
    }
    
    
    @IBAction func toSecondVC(_ sender: UIButton) {
        performSegue(withIdentifier: "toSecondVC", sender: self)
        
    }
    
    @IBAction func unwindToFirstViewController(_ unwindSegue: UIStoryboardSegue) {
        useUserDefaults.text = nil
        useSingleton.text = nil
    }

    // use Delegate
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: self)
        guard let secondVC = segue.destination as? SecondViewController else {
            print("in secondVC guard")
            return
        }
        print("in prepare: ", useDelegate2.text)
        guard let text = useDelegate2.text else {
            return
        }
        secondVC.textForSecondVC = text
        secondVC.delegate = self
    }
    
}

extension FirstViewController: SecondViewControllerDelegate {
    func workHasan2() -> String {
        print("run")
        return useDelegate2.text ?? ""
    }
}
