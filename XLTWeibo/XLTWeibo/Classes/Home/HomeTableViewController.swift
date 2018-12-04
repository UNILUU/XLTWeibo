//
//  HomeTableViewController.swift
//  XLTWeibo
//
//  Created by  on 12/2/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseTableViewController {
    lazy private var titleButon = TitleButton()
    lazy private var popOverAnimator = PopOverAnimator {[weak self] (presented) in
        self?.titleButon.isSelected = presented
    }
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
        titleButon.label.text = "Home"
        titleButon.addTarget(self, action: #selector(HomeTableViewController.titleBtnClick), for: .touchUpInside)
        navigationItem.titleView = titleButon
        
    }
}


//MARK: event
extension HomeTableViewController{
    @objc private func titleBtnClick() {
        titleButon.isSelected = !titleButon.isSelected
        let popover = PopoverViewController()
        popover.modalPresentationStyle = .custom
        
        popOverAnimator.popOverViewFrame = CGRect(x: view.bounds.size.width / 2 - 100, y: 50, width: 200, height: 300)
        popover.transitioningDelegate = popOverAnimator
        present(popover, animated: true, completion: nil)
    }
}

