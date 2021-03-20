//
//  Constant.swift
//  ColorShop
//
//  Created by Afnan on 3/15/20.
//  Copyright © 2020 Afnan. All rights reserved.
//

import Foundation

enum Constant: String {
    case isDarkMode = "isDarkMode"
    case currentUser = "currentUser"
    case language    = "language"
    case token       = "token"
    case isReady     = "isReady"
    case en          = "c=en|uic=en-US"
    case ar          = "c=ar|uic=ar-EG"
    case cartItemsCount = "cartItemsCount"
}

class KeyConstant {

}

class UserDefaultValues {
    
    static let instance = UserDefaultValues()
    
    private init() {
        
    }
    
    func isReady() -> String {
        return UserDefaults.standard.string(forKey: Constant.isReady.rawValue) ?? "false"
    }
}
