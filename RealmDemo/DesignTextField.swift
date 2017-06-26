//
//  DesignTextField.swift
//  RealmDemo
//
//  Created by Mohamed El-Naggar on 6/26/17.
//  Copyright © 2017 Mohamed El-Naggar. All rights reserved.
//

import UIKit

@IBDesignable

class DesignUIView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 10
        
        // shadow
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 8
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        
    }
}
