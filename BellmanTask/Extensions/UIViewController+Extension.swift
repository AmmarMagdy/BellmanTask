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
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func popVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func isNullOrEmpty(_ model: [Any]?) -> Bool {
        if let _ = model {
            if model!.count > 0 {
                return false
            }
        }
        return true
    }
    
    
    func isNullOrEmpty(_ model: String?) -> Bool {
        if let _ = model {
            if model!.count > 0 {
                return false
            }
        }
        return true
    }
    
    @objc func openSideMenu() {
//        let viewController = SideMenuViewController()
//        viewController.modalPresentationStyle = .overFullScreen
//        viewController.modalTransitionStyle = .crossDissolve
//        viewController.pushFromController = self
//        self.present(viewController, animated: true, completion: nil)
    }
    
    func addNothingAvailableLabel(_ color: UIColor = .lightGray) {
        let nothingLabel: UILabel = { //added if API has nothing to display
            let label = UILabel()
            label.textAlignment = .center
            label.textColor = color
            label.tag = 555
//            label.font = UIFont.appFontBold(ofSize: 18)
//            label.text = "No items".localized()
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        view.addSubview(nothingLabel)
//        nothingLabel.snp.makeConstraints {
//            make in
//            make.width.equalTo(self.view.snp.width).multipliedBy(0.7)
//            make.height.equalTo(60)
//            make.center.equalTo(self.view.snp.center)
//        }
    }
    
    func removeChildView(_ viewController: UIViewController) {
        let previousViewController =  viewController
        guard parent != nil else {
            return
        }
        previousViewController.willMove(toParent: nil)
        previousViewController.removeFromParent()
        previousViewController.view.removeFromSuperview()
    }
    
    func addChildViewController(_ contentView: UIView, _ viewController: UIViewController) {
        addChild(viewController)
        viewController.view.frame = contentView.frame
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        viewController.view.translatesAutoresizingMaskIntoConstraints = true
//        viewController.view.snp.makeConstraints {
//            make in
//            make.top.bottom.equalTo(contentView)
//            make.left.right.equalTo(contentView)
//        }
    }

    func presentViewController(_ viewController : UIViewController) {
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .coverVertical
        self.present(viewController, animated: true, completion: nil)
    }
    
    func removeNothingLabel() {
        _ = self.view.subviews.map {
            if $0.tag == 555 {
                $0.removeFromSuperview()
            }
        }
    }
    
    func isSesionEnded() -> Bool {
        if let _ = UserDefaults.standard.string(forKey: Constant.token.rawValue) {
            return false
        } else {
            return true
        }
    }
    
    func openViewControllerAsRoot(_ viewController: UIViewController) {
//        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController?.isNavigationBarHidden = true
//        navigationController.interactivePopGestureRecognizer?.isEnabled = true
        navigationController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        self.navigationController?.viewControllers = 
        self.navigationController?.viewControllers = [viewController]
    }
    
    func saveUserDate(_ token: String?) {
        if token != nil {
            UserDefaults.standard.set(token, forKey: Constant.token.rawValue)
        }
    //        if profile != nil {
    //            UserDefaults.standard.set(profile?.toDictionary(), forKey: Constant.currentUser.rawValue)
    //        }
    }
    
   @objc func openHome() {
//        let myVC = TabBarViewController.instantiateFromNib()
//        let viewController = UINavigationController(rootViewController: myVC)
//        viewController.isNavigationBarHidden = false
//        UIApplication.shared.keyWindow?.rootViewController = viewController
//        DarkModeConfiguration.instance.changeToLightMode()
    }
    
    func openSuccessView(_ description: String, _ title: String? = nil) {
//        let viewController = SuccessViewController()
//        viewController.descriptionString = description
//        if title != nil {
//            viewController.title = title
//        }
//        presentViewController(viewController)
    }
    
    func userNotLogin() {
        removeLocalStorage()
    }
    
    func removeLocalStorage() {
        let language = UserDefaults.standard.string(forKey: Constant.language.rawValue)
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        UserDefaults.standard.set(language, forKey: Constant.language.rawValue)
    }
    
    //appAlertAction
    @objc func confirmForAppAlert(_ sender: UIButton) {
        
    }
}

extension UIViewController { //customize navigation
    
    func setupNavigationBar(_ title: String = "") {
        addNavigationBarShadow()
        customizeNaviagtionBar()
        self.navigationItem.title = title
    }
    
    func addNavigationBarShadow() {
        self.navigationController?.navigationBar.layer.masksToBounds = false
//        self.navigationController?.navigationBar.layer.shadowColor = UIColor.primaryLightColor().cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.5
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 5
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func customizeNaviagtionBar() {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Icon Left"), for: .normal)
//        if !Language.shared.isEnglish() {
//            button.transform = button.transform.rotated(by: .pi) // 180˚
//        }
        button.setTitle("", for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(backBtnPressed(sender:)), for: .touchUpInside)
        
        let leftBtn = UIBarButtonItem(customView: button)
        leftBtn.style = .plain
        navigationItem.leftBarButtonItem = leftBtn
    }
    
    @objc func backBtnPressed(sender: UIBarButtonItem) {
        popVC()
    }
}

extension UIViewController: UIGestureRecognizerDelegate {
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer.isEqual(navigationController?.interactivePopGestureRecognizer) {
            navigationController?.popViewController(animated: true)
        }
        return true
    }
}

extension CATransition {
    
    //New viewController will appear from bottom of screen.
    func segueFromBottom() -> CATransition {
        self.duration = 0.375 //set the duration to whatever you'd like.
        self.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.type = CATransitionType.moveIn
        self.subtype = CATransitionSubtype.fromTop
        return self
    }
    //New viewController will appear from top of screen.
    func segueFromTop() -> CATransition {
        self.duration = 0.375 //set the duration to whatever you'd like.
        self.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.type = CATransitionType.moveIn
        self.subtype = CATransitionSubtype.fromBottom
        return self
    }
    //New viewController will appear from left side of screen.
    func segueFromLeft() -> CATransition {
        self.duration = 0.3 //set the duration to whatever you'd like.
        self.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.type = CATransitionType.moveIn
        self.subtype = CATransitionSubtype.fromLeft
        return self
    }
    //New viewController will pop from right side of screen.
    func popFromRight() -> CATransition {
        self.duration = 0.1 //set the duration to whatever you'd like.
        self.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.type = CATransitionType.reveal
        self.subtype = CATransitionSubtype.fromRight
        return self
    }
    //New viewController will appear from left side of screen.
    func popFromLeft() -> CATransition {
        self.duration = 0.3 //set the duration to whatever you'd like.
        self.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.type = CATransitionType.reveal
        self.subtype = CATransitionSubtype.fromLeft
        return self
    }
}

