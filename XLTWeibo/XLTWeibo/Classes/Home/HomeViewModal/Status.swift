//
//  Status.swift
//  XLTWeibo
//
//  Created by  on 12/9/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//

import UIKit

class Status: NSObject {
    
    @objc var text : String = ""
    @objc var created_at: String = ""
    @objc var source: String = ""
    @objc var mid: String = ""
    var user: User?
    
    init(Dic: [String: Any]) {
        super.init()
        setValuesForKeys(Dic)
        if let userDic = Dic["user"] as? [String: Any] {
            user = User(dic: userDic)
        }
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}
