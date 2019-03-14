//
//  HomeTableViewCell.swift
//  XLTWeibo
//
//  Created by  on 12/9/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//

import UIKit
import SDWebImage


class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var contentLabelWidthCon: NSLayoutConstraint!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var registorIcon: UIImageView!
    @IBOutlet weak var createD: UILabel!
    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var vipIcon: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    var viewModal : StatusViewModal? {
        didSet {
            guard let viewModal = viewModal else {
                return
            }
            self.separatorInset = UIEdgeInsets.zero
            
            userImage.layer.cornerRadius = userImage.frame.height/2
            userImage.clipsToBounds = true
            registorIcon.image = viewModal.verifiedImage
            vipIcon.image = viewModal.vipImage
            createD.text = viewModal.createString
            userName.text = viewModal.status?.user?.screen_name
            if viewModal.vipImage != nil{
                userName.textColor = UIColor.orange
            }
            source.text = viewModal.sourceText
            contentLabel.text = viewModal.status?.text
            userImage.sd_setImage(with: URL(string: (viewModal.status?.user?.profile_image_url)!)!, completed: nil)
    
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        contentLabelWidthCon.constant = UIScreen.main.bounds.width - 30.0
    }

    
}
