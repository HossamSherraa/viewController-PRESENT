//
//  popOverView.swift
//  viewController
//
//  Created by Hossam on 4/24/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
class popOverBackView : UIPopoverBackgroundView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        let backView = UIView(frame: frame)
        self.addSubview(backView)
        backView.backgroundColor = .red
        backView.layer.cornerRadius = 30
    }
    
    override var arrowOffset: CGFloat {
        get {
            return 10
        }
        set {}
    }
    override var arrowDirection: UIPopoverArrowDirection {
         get {
            return .up
               }
               set {}
    }
    override class func contentViewInsets() -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 0, right: 0)
    }
    override class func arrowBase() -> CGFloat {
        30
    }
    
    override class func arrowHeight() -> CGFloat {
        60
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
