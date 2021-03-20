//
//  HorizontalCollectionCell.swift
//  BellmanTask
//
//  Created by Ammar.M on 20/03/2021.
//

import UIKit

class HorizontalCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let homeCellIdentifier = "homeCellIdentifier"
    
    var section: ItemSections!
    var hotspotsData: [Data]!
    var eventsData: [Data]!
    var attractionsData: [Data]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCollectionViewCell()
        
    }
    
    func loadCellData(_ section: ItemSections, _ data: [Data]) {
        self.section = section
        guard let section = self.section else { return }
        switch section {
        case .hotspots:
            hotspotsData = data
        case .events:
            eventsData = data
        case .attractions:
            attractionsData = data
        }
        self.collectionView.reloadData()
    }
    
    func registerCollectionViewCell() {
        let nib = UINib(nibName: "HomeCollectionCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: homeCellIdentifier)
    }
    
}

extension HorizontalCollectionCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = self.section else { return 0 }
        switch section {
        case .hotspots:
            return hotspotsData != nil ? hotspotsData.count : 0
        case .events:
            return eventsData != nil ? eventsData.count : 0
        case .attractions:
            return attractionsData != nil ? attractionsData.count : 0
        }
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeCellIdentifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as! HomeCollectionCell
        guard let section = section else { return }
        switch section {
        
        case .hotspots:
            cell.loadCellData(hotspotsData[indexPath.row])
            
        case .events:
            cell.loadCellData(eventsData[indexPath.row])
            
        case .attractions:
            cell.loadCellData(attractionsData[indexPath.row])
            
        }
    }
}
