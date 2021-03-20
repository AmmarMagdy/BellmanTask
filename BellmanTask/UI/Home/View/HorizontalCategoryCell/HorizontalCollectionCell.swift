//
//  HorizontalCollectionCell.swift
//  BellmanTask
//
//  Created by Ammar.M on 20/03/2021.
//

import UIKit

class HorizontalCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let hotspotsCellIdentifier = "hotspotsCellIdentifier"

    override func awakeFromNib() {
        super.awakeFromNib()
        registerCollectionViewCell()
        
    }
    
    func registerCollectionViewCell() {
        let nib = UINib(nibName: "HotspotsCollectionCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: hotspotsCellIdentifier)
    }
    
}

extension HorizontalCollectionCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width  = collectionView.bounds.width
        let height = collectionView.bounds.height
            return CGSize.init(width: width * 0.55, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: hotspotsCellIdentifier, for: indexPath)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let _ = cell as! HotspotsCollectionCell
    }
}
