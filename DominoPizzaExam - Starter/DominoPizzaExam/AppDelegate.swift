//
//  AppDelegate.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
  
    let wishListVC = WishListViewController()
    
  var window: UIWindow?
  
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let tabBarController = UITabBarController()
        let categoryVC = CategoryViewController()
        categoryVC.title = "Domino's"
        categoryVC.productVC.detailVC.delegate = self
        wishListVC.title = "Wish List"
        
        let orderNavi = UINavigationController.init(rootViewController: categoryVC)
        let wishNavi = UINavigationController.init(rootViewController: wishListVC)
        
        orderNavi.tabBarItem = UITabBarItem(title: "Domino's", image: nil, selectedImage: nil)
        wishListVC.tabBarItem = UITabBarItem(title: "Wish List", image: nil, selectedImage: nil)
        tabBarController.viewControllers = [orderNavi, wishNavi]
        window?.backgroundColor = .white
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
        
        
        
    }
    
    
}

extension AppDelegate: DetailViewControllerDelegate {
    func reload() {
        wishListVC.names = Data.shared.countDict.keys.sorted()
        wishListVC.tableView.reloadData()
        print("run", Data.shared.countDict.count)
    }
    
    
}
