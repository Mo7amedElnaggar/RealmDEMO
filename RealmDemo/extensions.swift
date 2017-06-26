//
//  extensions.swift
//  RealmDemo
//
//  Created by Mohamed El-Naggar on 6/26/17.
//  Copyright © 2017 Mohamed El-Naggar. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespaces)
    }
    
    var checkMail: Bool {
        
        return self.contains("@") && self.contains(".com")
    }
}


extension UITextField {
    
    func removeBorder() {
        
        self.borderStyle = .none
        
    }
    
}
