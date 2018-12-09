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
    @objc var created_at: String = "" {
        didSet {
            guard created_at != "" else {
                return
            }
            createString = Date.createDateString(createAt: created_at)
            print(createString)
        }
    }
    var createString : String?
    @objc var source: String = "" {
        didSet{
            guard source != "" else  {
                return
            }
            //<a href="http://app.weibo.com/t/feed/4fw5aJ" rel="nofollow">秒拍网页版</a>
            let startIndex = (source as NSString).range(of: ">").location + 1
            let length = (source as NSString).range(of: "</a").location - startIndex
            sourceText = (source as NSString).substring(with: NSRange(location: startIndex, length: length)) as? String
        }
    }
    @objc var mid: String = ""
    
    
    var sourceText: String?
    
    init(Dic: [String: Any]) {
        super.init()
        setValuesForKeys(Dic)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}
