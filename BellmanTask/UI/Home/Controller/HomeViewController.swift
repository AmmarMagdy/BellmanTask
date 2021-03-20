//
//  HomeViewController.swift
//  BellmanTask
//
//  Created by Ammar.M on 20/03/2021.
//

import UIKit

enum itemSections {
    case hotspots
    case events
    case attractions
}

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let categoryCellIdentifier = "categoryCellIdentifier"
    private let sectionHeaderIdentifier = "sectionHeaderIdentifier"
    var itemSections : [itemSections] = [.hotspots, .events, .attractions]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRegisterCollectionView()
    }
    
    func setupRegisterCollectionView() {
        collectionView.register(UINib.init(nibName: "HomeHeaderReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: sectionHeaderIdentifier)
        let nib = UINib(nibName: "HorizontalCollectionCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: categoryCellIdentifier)
    }

}

extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: sectionHeaderIdentifier, for: indexPath) as! HomeHeaderReusableView
        switch itemSections[indexPath.section]{
        case .hotspots:
            headerView.titleLabel.text = "Hotspots"
        case .events:
            headerView.titleLabel.text = "Events"
        case .attractions:
            headerView.titleLabel.text = "Attractions"
        }
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = Double(collectionView.bounds.width) - 30
        let height: Double = Double(self.view.bounds.height * 0.05)
        return CGSize(width: width, height: height)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets  {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width  = collectionView.bounds.width
        let height = view.bounds.height
        
        return CGSize.init(width: width * 0.9, height: height * 0.3)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellIdentifier, for: indexPath)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let _ = cell as! HorizontalCollectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

