//
//  BaseTableViewController.swift
//  XLTWeibo
//
//  Created by  on 12/2/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    let visitorView : VisitorView = VisitorView.visitorView()
    var isLogIn : Bool = UserModal.sharedInstance.isLoggedIn
    override func loadView() {
        print(UserModal.sharedInstance.accountPath)
        
        UserModal.sharedInstance.isLoggedIn ? super.loadView() : setUpVisiterView()
    }
    override func viewDidLoad() {
        setNevigationItem()
    }
}

//MARK: set up View
extension BaseTableViewController {
    private func setUpVisiterView(){
        view = visitorView
        visitorView.logInBtn.addTarget(self, action: #selector(BaseTableViewController.login), for: .touchUpInside)
        visitorView.registerBtn.addTarget(self, action: #selector(BaseTableViewController.register), for: .touchUpInside)
    }
    
    private func setNevigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(BaseTableViewController.register))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log in", style: .plain, target: self, action: #selector(BaseTableViewController.login))
    }
}


//MARK: action
extension BaseTableViewController {
    @objc private func login(){
        let loginVC = OAuth2ViewController()
        let naviVC = UINavigationController(rootViewController: loginVC)
        naviVC.modalPresentationStyle = .custom
        present(naviVC, animated: true, completion: nil)
    }
    
    @objc private func register() {
        print("register")
    }
}
