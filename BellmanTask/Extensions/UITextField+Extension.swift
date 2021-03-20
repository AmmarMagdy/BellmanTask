//
//  UITextField+Extension.swift
//  manzeli
//
//  Created by Afnan on 10/9/19.
//  Copyright © 2019 Afnan. All rights reserved.
//

import UIKit

extension UITextField {
    
    open override class func awakeFromNib() {
        super.awakeFromNib()
    }

    func changePlaceholderTextColor(_ placeholder: String = "", _ color: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)) {
        
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? placeholder,
                                                        attributes: [NSAttributedString.Key.foregroundColor: color])
    }
}

