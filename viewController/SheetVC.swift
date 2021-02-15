//
//  SheetVC.swift
//  viewController
//
//  Created by Hossam on 4/23/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
class MyView : UIView {
    override func layoutSubviews() {
        
    }
}
class SheetVC : UIViewController  , UIViewControllerTransitioningDelegate{
    let string : String
    let button : UIButton
    
    var labelConstraints = [NSLayoutConstraint]()
    init(string : String  , button : UIButton) {
        self.string = string
        self.button = button
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .popover
        self.popoverPresentationController?.delegate = self
      
        self.transitioningDelegate = self
        self.view.backgroundColor = .red
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .brown
        self.containerConstrains = [
            containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor , constant: 0) ,
            containerView.topAnchor.constraint(equalTo: self.view.topAnchor ,constant: 0) ,
            view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor , constant: 0),
            view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor , constant: 0)
            
        ]
        
        
        
        self.view.addSubview(containerView)
        
                     
              let label : UILabel = {
                  let label = UILabel()
                  label.textColor = .white
                  label.translatesAutoresizingMaskIntoConstraints = false
                  containerView.addSubview(label)
                  self.labelConstraints = [
                    label.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor , constant:  5),
                    label.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor)
                  ]
                  
                  label.text = self.string
                  label.numberOfLines = 0
                  label.textAlignment = .center
                  return label
              }()
              
              
              
              self.myLabel = label
              self.enableConstraints()
    }
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var myLabel : UILabel!
    var containerConstrains = [NSLayoutConstraint]()
     let containerView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
          }
    
    
       
        
    
    
   
    func enableConstraints(){
        NSLayoutConstraint.activate( self.labelConstraints)
    }
    func disableConstraints(){
        self.labelConstraints.forEach { $0.isActive = false  }
    }
   
    
   
}


extension SheetVC : UIPopoverPresentationControllerDelegate {
   
    
    
    
   
    
    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        popoverPresentationController.sourceRect = .init(x: 120, y: 120, width: 20, height: 80)
        popoverPresentationController.backgroundColor = .black
        self.preferredContentSize = self.myLabel.sizeThatFits(.init(width: 320, height: CGFloat.infinity))
        popoverPresentationController.popoverLayoutMargins = .init(top: 150, left:0, bottom: 0, right: 0  )
        popoverPresentationController.canOverlapSourceViewRect = true
        popoverPresentationController.permittedArrowDirections = [.left , .right]

    }
}
