//
//  AppDelegate.swift
//  20190406 up's 과제
//
//  Created by hyeoktae kwon on 07/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let friendsListVC = FriendsListVC()
        let preferencesVC = PreferencesVC()
        let addFriendsVC = AddFriendsVC()
        friendsListVC.title = "친구목록"
        preferencesVC.title = "설정"
        addFriendsVC.title = "친구추가"
        
        let tabbarC = UITabBarController()
        let friendsListNaviC = UINavigationController(rootViewController: friendsListVC)
        let preferencesNaviC = UINavigationController(rootViewController: preferencesVC)
        
        tabbarC.viewControllers = [friendsListNaviC, preferencesNaviC]
        
        friendsListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        preferencesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        window?.rootViewController = tabbarC
        window?.makeKeyAndVisible()
        
        
        
        return true
        
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

