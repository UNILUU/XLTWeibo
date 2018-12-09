//
//  UserAccount.swift
//  XLTWeibo
//
//  Created by  on 12/6/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//

import UIKit
import Foundation

class UserAccount : NSObject, NSCoding{
    var uid: String? = ""
    var userImage: String?
    var expire_date: Date?
    var access_token: String? = ""
    var imageURL: String?
    var displayName: String?
    var expires_in: NSNumber? = 0.0{
        didSet{
            expire_date = Date(timeIntervalSinceNow: expires_in!.doubleValue)
        }
    }

    override init() {
        
    }
    func setAccountData(dic: [String: Any]) {
        if let expire = dic["expires_in"] as? NSNumber {
            expires_in = expire
        }
        if let id = dic["uid"]  {
            uid = id as? String
        }
        if let token = dic["access_token"] {
            access_token = token as? String
        }
        if let name = dic["screen_name"] {
            displayName = name as? String
        }
        if let url = dic["avatar_hd"] {
            imageURL = url as? String
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        access_token = aDecoder.decodeObject(forKey: "access_token") as? String
        uid = aDecoder.decodeObject(forKey: "uid") as? String
        expire_date = aDecoder.decodeObject(forKey: "expire_date") as? Date
        displayName = aDecoder.decodeObject(forKey: "displayName") as? String
        imageURL = aDecoder.decodeObject(forKey: "imageURL") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(access_token, forKey: "access_token")
        aCoder.encode(uid, forKey: "uid")
        aCoder.encode(expire_date, forKey: "expire_date")
        aCoder.encode(imageURL, forKey: "imageURL")
        aCoder.encode(displayName, forKey: "displayName")
    }
    
    override var description: String{
        return "Get ------------- access_token: \(access_token!), expire_date: \(expire_date!), uid: \(uid!), displayName: \(displayName!), imageURL: \(imageURL!)"
    }
    
}
