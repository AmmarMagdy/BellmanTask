//
//  HomeViewController.swift
//  BellmanTask
//
//  Created by Ammar.M on 20/03/2021.
//

import UIKit

enum ItemSections {
    case hotspots
    case events
    case attractions
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let categoryCellIdentifier = "categoryCellIdentifier"
    private let sectionHeaderIdentifier = "sectionHeaderIdentifier"
    var itemSections : [ItemSections] = [.hotspots, .events, .attractions]
    var data: APIData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRegisterCollectionView()
        getHome()
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
            headerView.titleImageView.image = #imageLiteral(resourceName: "hotspot_icon")
            headerView.titleLabel.text = "Hotspots"
        case .events:
            headerView.titleImageView.image = #imageLiteral(resourceName: "events_icon")
            headerView.titleLabel.text = "Events"
        case .attractions:
            headerView.titleImageView.image = #imageLiteral(resourceName: "attarctions_icon")
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
        return data != nil ? itemSections.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data != nil ? 1 : 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets  {
        return UIEdgeInsets(top: 10, left: 5, bottom: 20, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width  = collectionView.bounds.width
        let height = view.bounds.height
        return CGSize.init(width: width * 0.95, height: height * 0.28)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellIdentifier, for: indexPath)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as! HorizontalCollectionCell
        switch itemSections[indexPath.section] {
        
        case .hotspots:
            cell.loadCellData(itemSections[indexPath.section], data.hotSpots)
            
        case .events:
            cell.loadCellData(itemSections[indexPath.section], data.events)
            
        case .attractions:
            cell.loadCellData(itemSections[indexPath.section], data.attractions)
            
        }
    }
}

extension HomeViewController {
    
    func getHome() {
        ActivityIndicator.instance.show(self.view)
        Request.requestAPI(router: .getHome, callbackSuccess: { [weak self] (result) in
            guard let self = self else {return}
            self.data = HomeAPI(fromDictionary: result).data
            self.checkEmptyModel()
        }, callbackFail: { (statusCode, message) in
            //AppAlert.instance.showAPIErrorMessage(statusCode, message, self)
        }) { (result) in
            print(result)
        }
    }
    
    func checkEmptyModel() {
        guard let _ = data else {return}
        if self.isNullOrEmpty(self.data.hotSpots) {
            removeEmptySection(.hotspots)
        }
        
        if self.isNullOrEmpty(self.data.events) {
            removeEmptySection(.events)
        }
        if self.isNullOrEmpty(self.data.attractions) {
            removeEmptySection(.attractions)
        }
        collectionView.reloadData()
        collectionView.layoutSubviews()
    }
    
    func removeEmptySection(_ section: ItemSections) {
        for (index,type) in itemSections.enumerated() {
            if type == section {
                itemSections.remove(at: index)
                break
            }
        }
    }
}


