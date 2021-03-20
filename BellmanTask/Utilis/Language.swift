////
////  Language.swift
////  ColorShop
////
////  Created by Afnan on 3/15/20.
////  Copyright © 2020 Afnan. All rights reserved.
////
//
//import UIKit
//
//class Language {
//    
//    static let shared = Language()
//    
//    func setMainLayout() {
//        
//        if isEnglish() {
//            UITabBar.appearance().semanticContentAttribute = .forceLeftToRight
//            UINavigationBar.appearance().semanticContentAttribute = .forceLeftToRight
//            UIView.appearance().semanticContentAttribute = .forceLeftToRight
//            DropDown.appearance().semanticContentAttribute = .forceLeftToRight
//        } else {
//            UITabBar.appearance().semanticContentAttribute = .forceRightToLeft
//            UINavigationBar.appearance().semanticContentAttribute = .forceRightToLeft
//            UIView.appearance().semanticContentAttribute = .forceRightToLeft
//            DropDown.appearance().semanticContentAttribute = .forceRightToLeft
//        }
//    }
//    
//    func isEnglish() -> Bool {
//        if UserDefaults.standard.string(forKey: Constant.language.rawValue) == Constant.en.rawValue {
//            return true
//        } else {
//            return false
//        }
//    }
//    
//    func changeLanguage(_ language: String) {
//        UserDefaults.standard.set(language, forKey: Constant.language.rawValue)
//        UserDefaults.standard.synchronize()
//    }
//
//    func currentLanguage() -> String {
//        return UserDefaults.standard.string(forKey: Constant.language.rawValue) ?? Constant.ar.rawValue
//    }
//}
//
