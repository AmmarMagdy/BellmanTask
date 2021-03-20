//
//  CustomTextView.swift
//  ColorShop
//
//  Created by Afnan on 1/21/21.
//

import Foundation

import UIKit

@IBDesignable class CustomTextView: UITextView {

    @IBInspectable var cornerRadius: Float {
        get {
            return Float(layer.cornerRadius)
        }
        set {
            layer.cornerRadius = CGFloat(newValue)
        }
    }

    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }

}
