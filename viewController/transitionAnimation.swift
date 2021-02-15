//
//  transitionAnimation.swift
//  viewController
//
//  Created by Hossam on 4/15/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit



class Animator :  NSObject , UIViewControllerAnimatedTransitioning {
   
    
   
    
        enum TransitionType {
        case presenting
        case dismissing
    }
    
    let transitionType: TransitionType
    
    init(transitionType: TransitionType) {
        self.transitionType = transitionType
        print("NEW ONE")
        super.init()
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let inView   = transitionContext.containerView
        
        
        
        var frame = inView.bounds
        
        switch transitionType {
        case .presenting:
            let toView   = transitionContext.view(forKey: .to)!
            frame.origin.y = -frame.size.height
            toView.frame = frame
            
            inView.addSubview(toView)
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                toView.frame = transitionContext.finalFrame(for: transitionContext.viewController(forKey: .to)!)
            }, completion: { finished in
                
                print("I ENDED THE ANIMATION WITH ," , transitionContext.transitionWasCancelled)
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                
            })
        case .dismissing:
            let fromView = transitionContext.view(forKey: .from)!
           
            
            if let toView =  transitionContext.view(forKey: .to){
                inView.insertSubview(toView, belowSubview: fromView)
           
            }
            
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                frame.origin.y = -frame.size.height
                fromView.frame = frame
                if let toView =  transitionContext.view(forKey: .to){
                    toView.frame = transitionContext.finalFrame(for: transitionContext.viewController(forKey: .from)!)
                    
                }
                
            }, completion: { finished in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                
               
            })
        }
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    
}
