//
//  AppDelegate.swift
//  NewTableView
//
//  Created by  on 12/11/18.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = NewTableViewController()
        window?.makeKeyAndVisible()
        return true
    }



}

