//
//  NSDate.swift
//  XLTWeibo
//
//  Created by  on 12/9/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//

import Foundation


extension Date {
    static func createDateString(createAt: String) -> String {
        
        //Mon Dec 10 05:17:14 +0800 2018
        let format = DateFormatter()
        format.dateFormat = "EEE MM dd HH:mm:ss Z yyyy"
        format.locale = Locale(identifier: "en")
        
        guard let createDate = format.date(from: createAt) else {
            return ""
        }
        //        print(createDate)
        
        let now = Date()
        
        let interval = Int(now.timeIntervalSince(createDate))
        
        if interval < 60 {
            return "Now"
        }
        if interval < 60 * 60 {
            return "\(interval / 60) mins ago"
        }
        
        
        let calendar = Calendar.current
        if calendar.isDateInToday(createDate){
            return "\(interval / (60 * 60)) hrs ago"
        }
        
        if calendar.isDateInYesterday(createDate){
            format.date(from: "Yesterday HH:mm")
            return "\(format.string(from: createDate))"
        }
        
        format.date(from: "yyyy-MM-dd")
        
        return format.string(from: createDate)
    }
    
    
}
