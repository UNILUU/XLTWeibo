//
//  VisitorView.swift
//  XLTWeibo
//
//  Created by  on 12/2/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//
import UIKit

class VisitorView : UIView {
    class func visitorView() -> VisitorView {
        return Bundle.main.loadNibNamed("VisitorView",owner: nil, options: nil)?.first as! VisitorView
    }
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var logInBtn: UIButton!
    
    
    func setupVisitorView(iconName: String, title: String){
        mainImage.image = UIImage(named: iconName)
        displayLabel.text = title
        backImage.isHidden = true
    }
    
    func addRotationAnimation() {
        let zRotationKeyPath = "transform.rotation.z"
        let rotation = CABasicAnimation(keyPath: zRotationKeyPath)
        rotation.fromValue = 0
        rotation.toValue = Double.pi * 2
        rotation.repeatCount = MAXFLOAT
        rotation.isRemovedOnCompletion = false
        rotation.duration = 5
        backImage.layer.add(rotation, forKey: nil)
    }
}
