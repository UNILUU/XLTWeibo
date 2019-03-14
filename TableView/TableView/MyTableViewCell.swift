//
//  myTableViewCell.swift
//  TableView
//
//  Created by  on 12/9/18.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView?.image = UIImage(named: "avatar_default")
        setNeedsLayout()
    }
    
    override func prepareForReuse() {
        imageView?.image = UIImage(named: "avatar_default")
        textLabel?.text = ""
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    
}
