//
//  UIBarButtonItem-extension.swift
//  XLTWeibo
//
//  Created by  on 12/3/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//
import UIKit

extension UIBarButtonItem {
    convenience init(imageName: String) {
        self.init()
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        btn.sizeToFit()
        self.customView = btn
    }
}

