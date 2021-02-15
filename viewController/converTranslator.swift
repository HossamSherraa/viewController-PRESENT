//
//  converTranslator.swift
//  viewController
//
//  Created by Hossam on 4/25/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
class ConvertAnimation : NSObject ,  UIViewControllerAnimatedTransitioning {
    enum State {
        case present
        case dismiss
    }
    let state : State
    let pressedButton : UIButton
     init(state : State , pressedButton : UIButton) {
        self.pressedButton = pressedButton
        self.state = state
    }
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let inerButton = self.pressedButton.subviews.first!
        
        
        switch self.state {
        case .present :
            let toVC = transitionContext.viewController(forKey: .to)! as! SheetVC
            let fromVC = transitionContext.viewController(forKey: .from)!
            let toView = toVC.view!
            let fromView = fromVC.view!
            let intialFrame = fromView.convert(inerButton.frame, from: self.pressedButton)
            toView.frame = intialFrame
            toVC.containerView.frame = .init(x: 0, y: 0, width: intialFrame.width, height: intialFrame.height)
            toVC.containerConstrains.forEach{$0.isActive = true }
            transitionContext.containerView.addSubview(toView)
            toVC.containerView.translatesAutoresizingMaskIntoConstraints = false
            
         
            //leading top tra bot
//
            let totalWidth = transitionContext.containerView.frame.width
            let totalHeight = transitionContext.containerView.frame.height
//            print(intialFrame.origin.x , intialFrame.origin.y , totalWidth - (intialFrame.width + intialFrame.origin.x) , totalHeight - (intialFrame.height + intialFrame.origin.y))
//            toVC.containerConstrains[0].constant = intialFrame.origin.x
//            toVC.containerConstrains[1].constant = intialFrame.origin.y
//            toVC.containerConstrains[2].constant = totalWidth - (intialFrame.width + intialFrame.origin.x)
//            toVC.containerConstrains[3].constant = totalHeight - (intialFrame.height + intialFrame.origin.y)
//             toView.frame = transitionContext.containerView.frame
            
            
            let containerView = transitionContext.containerView
            toView.translatesAutoresizingMaskIntoConstraints = false 
            let constraints = [
                toView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor , constant: intialFrame.origin.x) ,
                toView.topAnchor.constraint(equalTo: containerView.topAnchor ,constant: intialFrame.origin.y) ,
                containerView.trailingAnchor.constraint(equalTo: toView.trailingAnchor , constant: totalWidth - (intialFrame.width + intialFrame.origin.x)),
                containerView.bottomAnchor.constraint(equalTo: toView.bottomAnchor , constant: totalHeight - (intialFrame.height + intialFrame.origin.y))
                
            ]
            
            
          
        
            constraints.forEach{$0.isActive = true }
            toView.layoutIfNeeded()
            
          constraints[0].constant = 0
          constraints[1].constant = 0
          constraints[2].constant = 0
          constraints[3].constant = 0
            
                UIView.animate(withDuration: 1, animations: {
                    
                    containerView.layoutIfNeeded()
                   
                    
                    
                } , completion: {_ in
                    transitionContext.completeTransition(true)
                    })
            
            
        case .dismiss :
            let fromView = transitionContext.viewController(forKey: .from)!.view!
            let toView = transitionContext.viewController(forKey: .to)!.view!
            UIView.animate(withDuration: 1, animations: {
                fromView.frame = toView.convert(inerButton.frame, from: self.pressedButton)
            } , completion: {
                _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
        }
    }
}
