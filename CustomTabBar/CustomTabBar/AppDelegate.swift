//
//  AppDelegate.swift
//  CustomTabBar
//
//  Created by Wi on 18/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = UINavigationController(rootViewController: CustomTabBarViewController())
        window?.makeKeyAndVisible()
        return true
    }
}

