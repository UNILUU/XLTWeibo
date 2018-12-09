//
//  WelcomeViewController.swift
//  XLTWeibo
//
//  Created by  on 12/8/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomBackLabel: UILabel!
    @IBOutlet weak var userProfileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = UserModal.sharedInstance.user else {
            dismiss(animated: false, completion: nil)
            return
        }
        
        if let displayName = user.displayName {
            welcomBackLabel.text = "Welcom Back, \(displayName) !"
        }
        if let url = user.imageURL {
            userProfileImage.setImageWith(URL(string: url)!)
        }
        
        welcomBackLabel.alpha = 0
        userProfileImage.alpha = 0
        UIView.animate(withDuration: 2, delay: 0.5, options: [], animations: {
            self.welcomBackLabel.alpha = 1
            self.userProfileImage.alpha = 1
        }) { (_) in
            UIApplication.shared.keyWindow?.rootViewController = MainViewController()
        }
    }
}
