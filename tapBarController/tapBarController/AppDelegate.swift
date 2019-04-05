//
//  AppDelegate.swift
//  tapBarController
//
//  Created by hyeoktae kwon on 05/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        
        
        
        let firstVC = FirstViewController()
        let secondVC = SecondViewController()
                secondVC.title = "Second VC"
        firstVC.title = "First VC"
        
        let tabBarController = UITabBarController()
        let naviController = UINavigationController(rootViewController: firstVC)
        
        
        tabBarController.viewControllers = [naviController, secondVC]
        
        firstVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        
        window?.rootViewController = tabBarController
//        window?.rootViewController = naviController
        window?.makeKeyAndVisible()
        
        
        
        return true
    }



}

