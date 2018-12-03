//
//  TitleButton.swift
//  XLTWeibo
//
//  Created by  on 12/3/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//

import UIKit

class TitleButton: UIButton {

     convenience init(frame: CGRec, title:String) {
        self.init(frame: frame)
        setImage(UIImage(named: "navigationbar_arrow_down" ), for:.normal)
        setImage(UIImage(named: "navigationbar_arrow_up" ), for:.selected)
        setTitle(title, for: .normal)
        setTitleColor(UIColor.purple, for: .normal)
        sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.sizeToFit()
        titleLabel?.widthAnchor .constraint(equalToConstant: 40).isActive = true
        titleLabel?.leftAnchor .constraint(equalTo: self.leftAnchor).isActive = true
        imageView?.leftAnchor .constraint(equalTo: titleLabel!.rightAnchor).isActive = true
//        imageView?.rightAnchor .constraint(equalTo: self.rightAnchor).isActive = true
        
    }
}
