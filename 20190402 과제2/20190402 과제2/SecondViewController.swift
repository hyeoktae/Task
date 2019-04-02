//
//  SecondViewController.swift
//  20190402 과제2
//
//  Created by hyeoktae kwon on 02/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var countBird = 0
    var countDog = 0
    var countCat = 0

    @IBOutlet weak var imageView: UIImageView!
    
    var setImage: UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = setImage
    }
    
    @IBAction func allAdd1(_ sender: UIButton) {
        countCat += 1
        countBird += 1
        countDog += 1
        print(countDog)
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
