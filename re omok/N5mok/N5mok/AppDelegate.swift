//
//  AppDelegate.swift
//  N5mok
//
//  Created by hyeoktae kwon on 22/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//


import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    static var instance: AppDelegate {
        return (UIApplication.shared.delegate as! AppDelegate)
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        initializeApp()
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        KOSession.handleDidEnterBackground()
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        KOSession.handleDidBecomeActive()
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if KOSession.isKakaoAccountLoginCallback(url) {
            return KOSession.handleOpen(url)
        }
        return false
    }
    
    
    // MARK: - Initialize App
    
    private func initializeApp() {
        setupSessionChangeNotification()
        setupRootViewController()
    }
    
    private func setupSessionChangeNotification() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(didChangeKaKaoSession(_:)), name: .KOSessionDidChange, object: nil
        )
    }
    
    @objc func didChangeKaKaoSession(_ noti: Notification) {
        guard let session = noti.object as? KOSession else { return }
        session.isOpen() ? print("Login") : print("Logout")
        print("didChangeKaKaoSession")
    }
    
    func setupRootViewController() {
        let vc = KOSession.shared().isOpen() ? FindGameVC() : LoginVC()
        print(vc)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}


