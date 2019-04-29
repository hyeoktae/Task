//
//  AppDelegate.swift
//  TableViewCellIncrease
//
//  Created by hyeoktae kwon on 28/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let VC = ViewController()
        window?.rootViewController = VC
        window?.makeKeyAndVisible()
        
        return true
    }

    


}

