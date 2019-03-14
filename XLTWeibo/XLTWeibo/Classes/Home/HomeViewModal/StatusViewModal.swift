//
//  StatusViewModal.swift
//  XLTWeibo
//
//  Created by  on 12/9/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//

import UIKit

class StatusViewModal {
    var status : Status?
    var verifiedImage : UIImage?
    var vipImage : UIImage?
    var createString : String?
    var sourceText: String?
    
    
    
    init(status : Status) {
        self.status = status
        let source = status.source
        if source != "" {
            //<a href="http://app.weibo.com/t/feed/4fw5aJ" rel="nofollow">秒拍网页版</a>
            let startIndex = (source as NSString).range(of: ">").location + 1
            let length = (source as NSString).range(of: "</a").location - startIndex
            sourceText = (source as NSString).substring(with: NSRange(location: startIndex, length: length))
        }
        if status.created_at != ""{
            createString = Date.createDateString(createAt: status.created_at)
        }
        
        if let user = status.user {
            if user.mbrank > 0 && user.mbrank <= 6 {
                vipImage = UIImage(named: "common_icon_membership_level\(user.mbrank)")
            }
            let verified_type = user.verified_type
            switch verified_type {
            case 0:
                verifiedImage = UIImage(named: "avatar_vip")
            case 2,3,5:
                verifiedImage = UIImage(named: "avatar_enterprise_vip")
            case 220:
                verifiedImage = UIImage(named: "avatar_grassroot")
            default:
                verifiedImage = nil
            }
        }
        
        
    }
    
}

