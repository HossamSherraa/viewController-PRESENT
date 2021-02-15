//
//  preserntaionViewC.swift
//  viewController
//
//  Created by Hossam on 4/19/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
class PresentationController: UIPresentationController , UIAdaptivePresentationControllerDelegate {
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        self.delegate = self
    }
    override var frameOfPresentedViewInContainerView: CGRect {
        
            
        return presentedView!.frame
            
        }
    
        
    
   override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
    guard let toVC = presentedViewController as? SheetVC else {return}
   
   
    }
  
    override var shouldPresentInFullscreen: Bool {
        return true
    }
    
    override func adaptivePresentationStyle(for traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        print("I CALLED SY")
        if traitCollection.horizontalSizeClass == .regular {
            return .custom
        }else {
            return .custom
        }
    }

    func presentationController(_ controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        print("You CAn Change VC JERE")
        switch style {
        case .fullScreen:
            return ViewController()
        default : return nil
        }
       
    }
    
    func presentationController(_ presentationController: UIPresentationController, willPresentWithAdaptiveStyle style: UIModalPresentationStyle, transitionCoordinator: UIViewControllerTransitionCoordinator?) {
        switch style {
        case .none:
            print("NO CHANGED")
        default:
            print("DID CHANGED")
        }
    }
    
}

