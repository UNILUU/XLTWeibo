//
//  UIButton-extension.swift
//  XLTWeibo
//
//  Created by  on 12/2/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    convenience init(imageName: String, imageBGName: String) {
        self.init()
        setBackgroundImage(UIImage(named:imageBGName), for: .normal)
        setBackgroundImage(UIImage(named: imageBGName + "_highlied"), for: .highlighted)
        setImage(UIImage(named: imageName), for: .normal)
        setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        sizeToFit()
    }
}
