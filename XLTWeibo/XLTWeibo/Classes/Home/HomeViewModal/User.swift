//
//  User.swift
//  XLTWeibo
//
//  Created by  on 12/9/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//

import UIKit

class User: NSObject {
    @objc var profile_image_url: String = ""
    @objc var screen_name: String = ""
    @objc var verified_type: Int = -1
    @objc var mbrank : Int = -1
    init(dic: [String : Any]) {
        super.init()
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        //do nothing
    }
}
