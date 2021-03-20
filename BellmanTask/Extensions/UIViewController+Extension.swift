//
//  UIViewController+Extension.swift
//  manzeli
//
//  Created by Afnan on 10/1/19.
//  Copyright © 2019 Afnan. All rights reserved.
//

import AVFoundation
import UIKit

extension UIViewController {
    
    func isNullOrEmpty(_ model: [Any]?) -> Bool {
        if let _ = model {
            if model!.count > 0 {
                return false
            }
        }
        return true
    }
    
}
