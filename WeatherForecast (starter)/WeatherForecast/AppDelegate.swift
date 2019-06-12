//
//  AppDelegate.swift
//  WeatherForecast
//
//  Created by giftbot on 09/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = WeatherVC()
        
        window?.makeKeyAndVisible()
        
        return true
    }

}

//
//enum Sky: String {
//    case s01 = "맑음"
//    case s02 = "구름조금"
//}
//
//enum Sky2: String {
//    case s01 = "SKY_O01"
//}
//
//enum Sky3: String {
//    case s01 = "SKY_S01"
//}
