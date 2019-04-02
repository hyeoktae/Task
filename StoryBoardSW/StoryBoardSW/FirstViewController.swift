//
//  ViewController.swift
//  StoryBoardSW
//
//  Created by hyeoktae kwon on 02/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var count: Int = 0
    
    @IBOutlet weak var firstLabel: UILabel!
    
    //    var second: SecondViewController = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func unwindToFirstViewController(_ unwindSegue: UIStoryboardSegue) {
        //        count += 1
        
        guard let source = unwindSegue.source as? SecondViewController else { return }
        count -= source.minus
        firstLabel.text = "\(count)"
        print("A: \(count)")
        print("\(source.minus)")
    }
    
        override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    
            return !isOver50
        }
    
        var isOver50 = false
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        print("\n----------- [ prepare ] ---------")
        print(segue.destination)
        guard let dest = segue.destination as? SecondViewController, let id = segue.identifier else { return }
        
        count += id == "PlusOne" ? 1 : 10
        dest.count = count
        //        isOver50 = count > 50 ? true : false
        
        // 이벤트를 보내는 객체 (버튼 이벤트)
        
    }
    
    
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        super.performSegue(withIdentifier: identifier, sender: sender)
    }
    
    @IBAction func didTapPlusOneButton(_ sender: Any) {
        // ActionSegue -> shouldPerformSegue -> PerformSegue -> Prepare
        // ManualSegue -> ShouldPerformSegue(x) -> PerformSegue -> Prepare
        
        performSegue(withIdentifier: "PlusOne", sender: sender)
        
        
        //       let secondVC = SecondViewController()
        //        present(secondVC, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
        
        
//                storyboard.instantiateInitialViewController() //-> FirstViewController
        
        
        
    } 
    
    @IBAction func didTapPlusTenButton(_ sender: Any) {
        performSegue(withIdentifier: "PlusTen", sender: sender)
    }
    
    
    
}

