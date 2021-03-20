//
//  UIImageView+Extension.swift
//  manzeli
//
//  Created by Afnan on 10/8/19.
//  Copyright © 2019 Afnan. All rights reserved.
//
//
import Kingfisher

extension UIImageView {
    
    func tinted(with color: UIColor) {
        self.image = self.image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
    
    func showImage(_ url: String?, _ placeholder: UIImage = #imageLiteral(resourceName: "logoApp")) {
        guard let url = url else {
            self.contentMode = .scaleAspectFit
            self.image = placeholder
            return
        }
        var main: URL!
        if url.contains("http") {
            main = URL(string: url)
        } else {
//            main = URL(string: Router.baseURL + (url))
        }

        self.kf.indicator?.startAnimatingView()
        self.kf.indicatorType = .activity
        self.kf.setImage(with: main, completionHandler:   { [weak self] result in
            self?.kf.indicator?.stopAnimatingView()
            switch result {
            case .success:
                self?.contentMode = .scaleToFill
                break
            case .failure:
                self?.contentMode = .scaleAspectFit
                self?.image = placeholder
            }
        })
    }
    
//    func showImageWithTint(_ url: String, color: UIColor) {
//        let main = URL(string: Router.baseURL + url)
//        self.kf.indicator?.startAnimatingView()
//        self.kf.indicatorType = .activity
//        self.kf.setImage(with: main, placeholder: nil, options: nil, progressBlock: nil) {[weak self] result in
//            self?.kf.indicator?.stopAnimatingView()
//            
//            switch result {
//            case .success:
//                break
//            case .failure:
//                self?.image = #imageLiteral(resourceName: "FARWLogo")
//            }
//            self?.image = self?.image?.withRenderingMode(.alwaysTemplate)
//            self?.tintColor = color
//        }
//    }
//    
    func circleImageView(_ withBorder: Bool, _ color: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)) {
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        let width = bounds.width < bounds.height ? bounds.width : bounds.height
        self.frame.size = CGSize(width: width, height: width)
        self.layer.cornerRadius = self.bounds.width / 2
        if withBorder {
            self.layer.borderWidth = 3
            self.layer.borderColor = color.cgColor
        }
        
    }
    
}
extension UIImage {
    var circle: UIImage {
        let square = CGSize(width: 30, height: 30)
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: square))
        imageView.contentMode = .scaleToFill
        imageView.image = self
        imageView.layer.cornerRadius = square.width/2
        imageView.layer.masksToBounds = true
        UIGraphicsBeginImageContext(imageView.bounds.size)
        imageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }
    
    var resize: UIImage {
        let square = CGSize(width: 25, height: 25)
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: square))
        imageView.contentMode = .scaleAspectFit
        imageView.image = self
//        imageView.layer.cornerRadius = square.width/2
//        imageView.layer.masksToBounds = true
        imageView.image = imageView.image?.withRenderingMode(.alwaysOriginal)
        UIGraphicsBeginImageContext(imageView.bounds.size)
        imageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }
    
}
