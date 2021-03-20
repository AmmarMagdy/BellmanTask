//
//  UIView+Extension.swift
//  manzeli
//
//  Created by Afnan on 9/29/19.
//  Copyright © 2019 Afnan. All rights reserved.
//

//import SwiftIcons
//import SnapKit
//
//extension UIView {
//    
//    func isNullOrEmpty(_ model: [Any]?) -> Bool {
//        if let _ = model {
//            if model!.count > 0 {
//                return false
//            }
//        }
//        return true
//    }
//    
//    enum LINE_POSITION {
//        case top
//        case bottom
//    }
//    
//    func addLineToView(position : LINE_POSITION, color: UIColor) {
//        let lineView: UIView = {
//            let view = UIView()
//            view.tag = 222
//            view.backgroundColor = color
//            view.translatesAutoresizingMaskIntoConstraints = false
//            return view
//        }()
//        
//        self.addSubview(lineView)
//        
//        switch position {
//        case .top:
//            lineView.snp.makeConstraints() {
//                make in
//                make.width.equalTo(self.snp.width)
//                make.height.equalTo(1)
//                make.centerX.equalTo(self.snp.centerX)
//                make.top.equalTo(self.snp.top)
//            }
//            break
//        case .bottom:
//            lineView.snp.makeConstraints() {
//                make in
//                make.width.equalTo(self.snp.width)
//                make.height.equalTo(3)
//                make.centerX.equalTo(self.snp.centerX)
//                make.bottom.equalTo(self.snp.bottom)
//            }
//            break
//        }
//    }
//    
//    func removeLineView() {
//        _ = self.subviews.map {
//            if $0.tag == 222 {
//                $0.removeFromSuperview()
//            }
//        }
//    }
//    
//    func gradientBackgroundColor() {
//        var gradientLayer:CAGradientLayer!
//        
//        let colorTop = UIColor.white.cgColor
//        let colorBottom = UIColor.darkGray.cgColor
//        
//        gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [colorTop, colorBottom]
//        gradientLayer.locations = [0.0, 1.0]
//        
//        let height = UIScreen.main.bounds.height
//        let width = UIScreen.main.bounds.width
//        
//        gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: width, height: height)
//        
//        self.layer.insertSublayer(gradientLayer, at: 0)
//        
//    }
//    
//    func dropShadow(_ scale: Bool = true) {
//        layer.masksToBounds = false
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 0.3
//        layer.shadowOffset = CGSize(width: -1, height: 1)
//        layer.shadowRadius = 1
//        
//        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
//        layer.shouldRasterize = true
//        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
//    }
//    
//    func addNothingAvailableLabel(_ title: String = "No items".localized()) {
//        
//        let nothingLabel: UILabel = { //added if API has nothing to display
//            let label = UILabel()
//            label.textAlignment = .center
//            label.textColor = UIColor.lightGray
//            label.font = UIFont.appFontBold(ofSize: 18)
//            label.text = title
//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.tag = 500 //any tag like an identifier for label
//            return label
//        }()
//        self.addSubview(nothingLabel)
//        nothingLabel.snp.makeConstraints {
//            make in
//            make.width.equalTo(self.snp.width).multipliedBy(0.7)
//            make.height.equalTo(60)
//            make.center.equalTo(self.snp.center)
//        }
//    }
//    
//    func removeNothingLabel() {
//        _ = self.subviews.map {
//            if $0.tag == 500 {
//                $0.removeFromSuperview()
//            }
//        }
//    }
//    
//    func isRounded(_ color: UIColor? = nil) {
//        self.layer.masksToBounds = true
//        self.layer.cornerRadius = self.bounds.height / 2
//        if color != nil {
//            self.layer.borderWidth = 3.5
//            self.layer.borderColor = color?.cgColor
//        }
//    }
//    
//    func addErrorLabel(_ changePosition: Bool = false) {
//        let label: UILabel = {
//            let label = UILabel()
//            label.tag = 111 //to remove label from any view with its tag
//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.setIcon(icon: .fontAwesomeSolid(.exclamationCircle), iconSize: 20, color: .red, bgColor: .clear)
//            return label
//        }()
//        self.addSubview(label)
//        label.snp.makeConstraints() {
//            make in
//            make.centerY.equalTo(self.snp.centerY)
//            make.width.height.equalTo(30)
//            //            if Language.shared.isEnglish() {
//            if type(of: self) == UITextView.self {
//                make.leading.equalTo(self).offset(10)
//            }
//            make.trailing.equalTo(self).offset(-10)
//            
//            //            } else {
//            //                            make.leading.equalTo(self.snp.leading).offset(10)
//            //            }
//        }
//        
//        //        if isAnimated {
//        //        addErrorAnimation()
//        //        }
//    }
//    //    func addErrorLabel() {
//    //        let label: UILabel = {
//    //            let label = UILabel()
//    //            label.tag = 111 //to remove label from any view with its tag
//    //            label.translatesAutoresizingMaskIntoConstraints = false
//    //            label.setIcon(icon: .fontAwesomeSolid(.exclamationCircle), iconSize: 20, color: .red, bgColor: .clear)
//    //            return label
//    //        }()
//    //        self.addSubview(label)
//    //        label.snp.makeConstraints() {
//    //            make in
//    //            make.centerY.equalTo(self.snp.centerY)
//    //            make.width.height.equalTo(30)
//    //            //            if Language.shared.isEnglish() {
//    //            if type(of: self) == UITextView.self {
//    //                make.leading.equalTo(self.snp.leading).offset(10)
//    //            }
//    //            make.trailing.equalTo(self.snp.trailing).offset(-10)
//    //
//    //            //            } else {
//    //            //                            make.leading.equalTo(self.snp.leading).offset(10)
//    //            //            }
//    //        }
//    //    }
//    
//    func addCheckedIcon() {
//        let label: UILabel = {
//            let label = UILabel()
//            label.tag = 100 //to remove label from any view with its tag
//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.setIcon(icon: .fontAwesomeSolid(.check), iconSize: 20, color: #colorLiteral(red: 0.4953507781, green: 0.8801655173, blue: 0.760992825, alpha: 1), bgColor: .clear)
//            return label
//        }()
//        self.addSubview(label)
//        label.snp.makeConstraints() {
//            make in
//            make.centerY.equalTo(self.snp.centerY)
//            make.width.height.equalTo(30)
//            //            if Language.shared.isEnglish() {
//            make.trailing.equalTo(self.snp.trailing).offset(-10)
//            
//            //            } else {
//            //                            make.leading.equalTo(self.snp.leading).offset(10)
//            //            }
//        }
//    }
//    
//    func removeCheckedIcon() {
//        _ = self.subviews.map {
//            if $0.tag == 100 {
//                $0.removeFromSuperview()
//            }
//        }
//    }
//    
//    func removeErrorLabel() {
//        _ = self.subviews.map {
//            if $0.tag == 111 {
//                self.tag = 0
//                $0.removeFromSuperview()
//            }
//        }
//    }
//    
//    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
//        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        self.layer.mask = mask
//    }
//    
//    public func round() {
//        let width = bounds.width < bounds.height ? bounds.width : bounds.height
//        let mask = CAShapeLayer()
//        mask.path = UIBezierPath(ovalIn: CGRect(x: bounds.midX - width / 2, y: bounds.midY - width / 2, width: width, height: width)).cgPath
//        mask.strokeColor = UIColor.white.cgColor;
//        mask.fillColor = UIColor.clear.cgColor;
//        self.layer.mask = mask
//    }
//    func addCheckedImage() {
//        let imageView: UIImageView = {
//            let imageView = UIImageView()
//            imageView.image = #imageLiteral(resourceName: "tick")
//            imageView.translatesAutoresizingMaskIntoConstraints = false
//            return imageView
//        }()
//        self.addSubview(imageView)
//        imageView.snp.makeConstraints() {
//            make in
//            make.centerY.equalTo(self.snp.centerY)
//            make.width.height.equalTo(30)
//            if Language.shared.isEnglish() {
//                make.right.equalTo(self.snp.right).offset(-10)
//            } else {
//                make.left.equalTo(self.snp.left).offset(10)
//            }
//        }
//    }
//    
//}
