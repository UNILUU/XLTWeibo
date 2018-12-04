//
//  PopOverAnimator.swift
//  XLTWeibo
//
//  Created by  on 12/4/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//

import UIKit

class PopOverAnimator : NSObject {
    var callBack: ((_ present: Bool) -> ())?
    var popOverViewFrame: CGRect = CGRect.zero
    
    init(animationFinished: @escaping (_ present : Bool) -> ()) {
        callBack = animationFinished
    }
}
//MARK: UIViewController Transition delegate
extension PopOverAnimator: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if let presentView = transitionContext.view(forKey: .to){
            transitionContext.containerView.addSubview(presentView)
            presentView.transform = CGAffineTransform(scaleX: 1, y: 0);
            UIView.animate(withDuration:transitionDuration(using: transitionContext), animations: {
                presentView.transform = CGAffineTransform.identity
            }) { (_) in
                transitionContext.completeTransition(true)
                self.callBack!(true)
            }
        }
        if let presentView = transitionContext.view(forKey: .from){
            UIView.animate(withDuration:transitionDuration(using: transitionContext), animations: {
                presentView.transform = CGAffineTransform(scaleX: 1, y: 0.001)
            }) { (_) in
                transitionContext.completeTransition(true)
                self.callBack!(false)
            }
        }
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        let presentationController = PopOverPresentationController(presentedViewController: presented, presenting: presenting)
        presentationController.presentViewFrame = popOverViewFrame
        return presentationController
        
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}

