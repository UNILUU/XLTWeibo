//
//  AppDelegate.swift
//  XLTWeibo
//
//  Created by  on 12/1/18.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    var defaultVC : UIViewController? {
        let isLogin = UserModal.sharedInstance.isLoggedIn
        return isLogin ? WelcomeViewController() : MainViewController()
    }
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UITabBar.appearance().tintColor = UIColor.purple
        UINavigationBar.appearance().tintColor = UIColor.purple
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = defaultVC
        window?.makeKeyAndVisible()
        return true
    }


}

