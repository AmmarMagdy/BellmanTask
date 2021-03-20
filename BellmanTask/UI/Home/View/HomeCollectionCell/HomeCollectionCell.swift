//
//  HomeCollectionCell.swift
//  BellmanTask
//
//  Created by Ammar.M on 20/03/2021.
//

import UIKit

protocol CellData {

    var descriptionField: String! {get}
    var name: String! {get}
    var photos : [String]! {get}
}

class HomeCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func loadCellData(_ model: CellData) {
        if let photos = model.photos {
            if photos.count > 0 {
                imageView.showImage(model.photos[0])
            }
        }
        nameLabel.text = model.name
        descriptionLabel.text = model.descriptionField
    }

}
