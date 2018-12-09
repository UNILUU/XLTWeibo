//
//  MainViewController.swift
//  XLTWeibo
//
//  Created by  on 12/2/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    private lazy var publishBtn : UIButton = UIButton(imageName: "tabbar_compose_icon_add" , imageBGName: "tabbar_compose_button")
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubViewControler()
        initPublishButton()
    }
}


//MARK: Set sub view controller
extension MainViewController {
    private func initPublishButton() {
        tabBar.addSubview(publishBtn)
        publishBtn.addTarget(self, action:#selector(MainViewController.publishBtnClick), for: .touchUpInside)
        publishBtn.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.size.height * 0.5)
    }
    
    private func initSubViewControler() {
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
        
        let count = dicArray.count
        for i in 0 ..< count {
            if i == count/2 {
                addChildViewController("", title: "", imageName: "")
            }
            
            guard let vcName = dicArray[i]["vcName"] else {
                continue
            }
            guard let imageName = dicArray[i]["imageName"] else{
                continue
            }
            guard let displayName = dicArray[i]["title"] else{
                continue
            }
            addChildViewController(vcName,title: displayName, imageName: imageName)
        }
        
    }
    private func addChildViewController(_ childString: String, title:String, imageName: String) {
        if childString.count == 0 {
            //add dummy vc
            let dummyVC = UIViewController()
            dummyVC.tabBarItem.isEnabled = false
            addChildViewController(dummyVC)
            return
        }
        guard let nameSpace = Bundle.main.object(forInfoDictionaryKey: "CFBundleExecutable") as? String else{
            print("cant get bundle name")
            return
        }
        guard let childVC = NSClassFromString(nameSpace + "." + childString) else {
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

//MARK: Event
extension MainViewController{
    @objc private func publishBtnClick() {
        print("sssss")
    }
    
    
}
