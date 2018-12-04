//
//  TitleButton.swift
//  XLTWeibo
//
//  Created by  on 12/3/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//

import UIKit

class TitleButton: UIButton {
    lazy var imgView = UIImageView()
    lazy var label = UILabel()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        label.textColor = UIColor.purple
        imgView.sizeToFit()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        addSubview(imgView)
        isUserInteractionEnabled = true
        
        isSelected = false
        imgView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imgView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: imgView.leadingAnchor, constant: -8).isActive = true
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open var isSelected: Bool {
        didSet {
            if isSelected{
                imgView.image = UIImage(named: "navigationbar_arrow_up")
            }else {
                imgView.image = UIImage(named: "navigationbar_arrow_down" )
            }
        }
    }
}
