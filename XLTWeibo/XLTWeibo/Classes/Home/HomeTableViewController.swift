//
//  HomeTableViewController.swift
//  XLTWeibo
//
//  Created by  on 12/2/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseTableViewController {
    lazy private var titleButon = TitleButton(coder: <#T##NSCoder#>)
    override func viewDidLoad() {
        super.viewDidLoad()
        if !isLogin {
            visitorView.addRotationAnimation()
            return
        }
        setupNavigationBar()
    }

   
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}

//MARK: set UI
extension HomeTableViewController {
    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention")
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop")
        titleButon.setTitle("Home", for: .normal)
        titleButon.addTarget(self, action: #selector(HomeTableViewController.titleBtnClick), for: .touchUpInside)
        navigationItem.titleView = titleButon
    }
}


//MARK: event
extension HomeTableViewController{
    @objc private func titleBtnClick() {
        titleButon.isSelected = !titleButon.isSelected
    }
}
