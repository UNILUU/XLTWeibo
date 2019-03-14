//
//  UserModal.swift
//  XLTWeibo
//
//  Created by  on 12/8/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//

import Foundation

class UserModal {
    
    static let sharedInstance = UserModal()
    
    var user : UserAccount?
    
    init() {
        //Load saved user
        user = NSKeyedUnarchiver.unarchiveObject(withFile: accountPath) as? UserAccount
        
    }
    
    var accountPath: String {
        let accountPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        return (accountPath as NSString).appendingPathComponent("account.plist")
    }
    
    var isLoggedIn: Bool {
        guard user != nil else {
            return false
        }
        guard let expires_date = user?.expire_date else {
            return false
        }
        return expires_date.compare(Date()) == ComparisonResult.orderedDescending
    }
}
