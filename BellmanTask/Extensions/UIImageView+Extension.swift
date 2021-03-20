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
    
    func showImage(_ url: String?, _ placeholder: UIImage = #imageLiteral(resourceName: "images")) {
        guard let url = url else {
            self.contentMode = .scaleAspectFit
            self.image = placeholder
            return
        }
        let main = URL(string: url)
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
}
