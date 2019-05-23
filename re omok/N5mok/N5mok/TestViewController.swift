//
//  TestViewController.swift
//  N5mok
//
//  Created by Alex Lee on 22/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
// 

import UIKit
import Firebase


final class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        
        let databaseRef = Database.database().reference()
        databaseRef.child("test").childByAutoId()
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
