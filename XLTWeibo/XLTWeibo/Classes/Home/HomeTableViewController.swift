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
    private var statuesModals : [StatusViewModal] = []
    lazy private var popOverAnimator = PopOverAnimator {[weak self] (presented) in
        self?.titleButon.isSelected = presented
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView?.register(HomeTableViewCell.self, forCellReuseIdentifier: "statusCell")
        tableView?.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "statusCell")// CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        if !isLogIn {
            visitorView.addRotationAnimation()
            return
        }
        setupNavigationBar()
        loadWeibo()
//        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.estimatedRowHeight = 44
    }
    
}


//MARK TABLE VIEW
extension HomeTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statuesModals.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statusCell", for: indexPath) as! HomeTableViewCell
        cell.viewModal = statuesModals[indexPath.row]
        cell.setNeedsUpdateConstraints()
//        cell.updateConstraintsIfNeeded()
//        [cell setNeedsUpdateConstraints];
//        [cell updateConstraintsIfNeeded];
        return cell
    }
}


//MARK: LOAD WEBO
extension HomeTableViewController {
    private func loadWeibo() {
        NetWorkingManager.shareInstance.getHomeTimeLine { (_ result, _ error) in
            guard error == nil else {
                return
            }
            guard let result = result else {
                return
            }
            for res in result {
                let curr = Status(Dic: res)
                self.statuesModals.append(StatusViewModal(status: curr))
            }
            self.tableView?.reloadData()
        }
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

