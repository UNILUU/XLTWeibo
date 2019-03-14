//
//  AppDelegate.swift
//  TableView
//
//  Created by  on 12/9/18.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = myTableViewController()
        window?.makeKeyAndVisible()
    
        return true
    }


}

