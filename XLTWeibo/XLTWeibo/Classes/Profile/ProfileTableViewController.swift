//
//  ProfileTableViewController.swift
//  XLTWeibo
//
//  Created by  on 12/2/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//

import UIKit

class ProfileTableViewController: BaseTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        visitorView.setupVisitorView(iconName: "visitordiscover_image_profile", title: "Log in to check your profile")
    }
}
