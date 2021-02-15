//
//  ViewController.swift
//  viewController
//
//  Created by Hossam on 4/13/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIViewControllerTransitioningDelegate , UIPopoverPresentationControllerDelegate {
    
    
  
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    let btn = UIButton(frame: .zero)
    override func viewDidLoad() {
       
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.view.backgroundColor = .white
        
        
       
            btn.backgroundColor = .green
        self.setEditing(true, animated: true)
        btn.addTarget(self, action: #selector(R), for: .touchUpInside)
        self.view.addSubview(btn)
        
        
        NSLayoutConstraint.activate([
            btn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor , constant:  0),
            btn.topAnchor.constraint(equalTo: self.view.topAnchor , constant:  0),
            btn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor ,constant: -40) ,
           
            btn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        let inButton = UIView(frame: .init(x: 30, y: 30, width: 100, height: 100))
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "When"
        label.textColor = .white
        inButton.backgroundColor = .red
        btn.addSubview(inButton)
        
   
        inButton.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: inButton.leadingAnchor , constant:  5) ,
            label.centerYAnchor.constraint(equalTo: inButton.centerYAnchor)])
        
        
    }
    
    @objc func R (){
       
        

        let newVC = ViewController()
        newVC.preferredContentSize = btn.frame.size
        newVC.modalPresentationStyle = .popover
        newVC.popoverPresentationController?.sourceView = self.btn
        newVC.popoverPresentationController?.sourceRect.origin = .init(x: 120, y: 120)
        
        newVC.popoverPresentationController?.delegate = self
        
       
        
                self.present(newVC, animated: true , completion: nil)
        newVC.preferredContentSize = .init(width: 300, height: 300)
        
        newVC.view.layoutIfNeeded()
      
       
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
    

    

    

}


