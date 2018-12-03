//
//  MainViewController.swift
//  XLTWeibo
//
//  Created by  on 12/2/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let path = Bundle.main.path(forResource: "MainVCSettings", ofType: "json") else {
            return
        }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
            return
        }
        guard let jsonResult = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) else {
            return
        }
        
        guard let dicArray = jsonResult as? [[String: String]] else {
            return
        }
        
        
        for dic in dicArray {
            guard let vcName = dic["vcName"] else {
                continue
            }
            guard let imageName = dic["imageName"] else{
                continue
            }
            guard let displayName = dic["title"] else{
                continue
            }
            addChildViewController(vcName,title: displayName, imageName: imageName)
        }
        
    }
    
    
    private func addChildViewController(_ childController: String, title:String, imageName: String) {
        guard let nameSpace = Bundle.main.object(forInfoDictionaryKey: "CFBundleExecutable") as? String else{
            print("cant get bundle name")
            return
        }
        guard let childVC = NSClassFromString(nameSpace + "." + childController) else {
            print("can't get child controller")
            return
        }
        guard let childType = childVC as? UIViewController.Type else {
            print("child controller not UIViewController")
            return
        }
        
        let childController = childType.init()
        childController.title = title
        childController.tabBarItem.image = UIImage(named:imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        let childNavC = UINavigationController(rootViewController: childController)
        addChildViewController(childNavC)
    }
}
