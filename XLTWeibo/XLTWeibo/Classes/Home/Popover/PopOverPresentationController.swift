//
//  PopOverPresentationController.swift
//  XLTWeibo
//
//  Created by  on 12/3/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//

import UIKit

class PopOverPresentationController: UIPresentationController {
    private lazy var maskView = UIView()
    var presentViewFrame : CGRect = CGRect.zero
    
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        presentedView?.frame = presentViewFrame
    
        containerView?.insertSubview(maskView, at:0)
        maskView.translatesAutoresizingMaskIntoConstraints = false
        maskView.centerXAnchor.constraint(equalTo:  containerView!.centerXAnchor).isActive = true
        maskView.centerYAnchor.constraint(equalTo:  containerView!.centerYAnchor).isActive = true
        maskView.widthAnchor.constraint(equalTo:  containerView!.widthAnchor).isActive = true
        maskView.heightAnchor.constraint(equalTo: containerView!.heightAnchor).isActive = true
        

        
        maskView.backgroundColor = UIColor.init(white: 0.4, alpha: 0.1)
        
        let gest = UITapGestureRecognizer(target:self, action: #selector(PopOverPresentationController.maskViewTap))
        maskView.addGestureRecognizer(gest)
    }
}


//MARK: TAP Event
extension PopOverPresentationController{
    @objc private func maskViewTap(){
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}
