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
    private let eventsCellIdentifier = "eventsCellIdentifier"

    var section: itemSections!
    var data: [Data]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCollectionViewCell()
        
    }
    
    func loadCellData(_ section: itemSections, _ data: [Data]) {
        self.section = section
        self.data = data
    }
    
    func registerCollectionViewCell() {
        let nib = UINib(nibName: "HomeCollectionCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: hotspotsCellIdentifier)
        let nib1 = UINib(nibName: "EventsCollectionCell", bundle: nil)
        collectionView.register(nib1, forCellWithReuseIdentifier: eventsCellIdentifier)
    }
    
}

extension HorizontalCollectionCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if let homeSection = self.section {
//            switch homeSection {
//            case .hotspots:
//                return itemSections.count
//            case .events:
//                return itemSections.count
//            case .attractions:
//                return itemSections.count
//            }
//        }
        return data != nil ? data.count : 0
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
        switch section {
        case .hotspots:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: hotspotsCellIdentifier, for: indexPath)
            return cell
        case .events:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: eventsCellIdentifier, for: indexPath)
            return cell
        case .attractions:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: hotspotsCellIdentifier, for: indexPath)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: hotspotsCellIdentifier, for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as! HomeCollectionCell
        cell.loadCellData(data[indexPath.row])
//        guard let section = section else { return }
//        switch section {
//
//        case .hotspots:
//            <#code#>
//        case .events:
//            <#code#>
//        case .attractions:
//            <#code#>
//        }
    }
}
