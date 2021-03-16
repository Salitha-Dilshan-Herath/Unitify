//
//  HistoryMethodTC.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-03-14.
//

import UIKit

protocol HistoryMethodTCDelegate {
    
    func itemTap(data: Any)
}
class HistoryMethodTC: UITableViewCell {
    
    @IBOutlet weak var imgMethod: UIImageView!
    @IBOutlet weak var lblMethodName: UILabel!
    @IBOutlet weak var viwBackground: UIView!
    @IBOutlet weak var viwImgBack: UIView!
    @IBOutlet weak var imgArrow: UIImageView!
    @IBOutlet weak var clvHistoryItem: UICollectionView!
    
    var selectedType: ConvertTypes!
    var historyItem: [Any]!
    var delegate: HistoryMethodTCDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setupCell()  {
        
        self.viwBackground.layer.cornerRadius = 10
        self.viwImgBack.layer.cornerRadius = (self.viwImgBack.frame.height ) / 2
        
    }
    
    func setupCLV()  {
        
        //MARK: Item Collection View Flow layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.clvHistoryItem!.collectionViewLayout = layout
        
        self.clvHistoryItem.delegate   = self
        self.clvHistoryItem.dataSource = self
        self.clvHistoryItem.isHidden   = false

        self.clvHistoryItem.reloadData()
    }
    
    func readHistoryData()  {
        
        if let items = getHistoryData(type: self.selectedType) {
            
            if !items.isEmpty {
                self.historyItem = items
                self.setupCLV()

            } else {
                self.clvHistoryItem.isHidden = true
            }
        
        } else {
            self.clvHistoryItem.isHidden = true
        }
    }

    func rotateArrow(isExpand: Bool)  {
        
        let name = !isExpand ? "chevron.right" : "chevron.down"
        
        imgArrow.image = UIImage(systemName: name, withConfiguration: UIImage.SymbolConfiguration(pointSize: 10, weight: .bold, scale: .small))
        
        imgArrow.contentMode = .scaleAspectFit
        
        if isExpand {
            self.readHistoryData()
        }
    }
    
    func getHistoryData(type: ConvertTypes) -> [Any]? {
        
        self.selectedType = type
        
        var data: [Any]?
        
        switch type {
        
        case .weight:
            
            data = UserDefaultsManager.getObject(type: [Weight].self, key: Constant.HISTORY_MANAGER_STORE_WEIGHT_DATA)
            
            break
        case .temperature:
            
            data = UserDefaultsManager.getObject(type: [Temperature].self, key: Constant.HISTORY_MANAGER_STORE_TEMPERATURE_DATA)
            
        case .length:
            
            data = UserDefaultsManager.getObject(type: [Length].self, key: Constant.HISTORY_MANAGER_STORE_LENGTH_DATA)
            
        case .speed:
            
            data = UserDefaultsManager.getObject(type: [Speed].self, key: Constant.HISTORY_MANAGER_STORE_SPEED_DATA)
            
        case .volume:
            
            data = UserDefaultsManager.getObject(type: [Volume].self, key: Constant.HISTORY_MANAGER_STORE_VOLUME_DATA)
            
        case .volumeliquid:
            
            data = UserDefaultsManager.getObject(type: [Liquid].self, key: Constant.HISTORY_MANAGER_STORE_LIQUID_DATA)
            
        }
        
        return data
    }
    
    func history_item_tap(data: Any) {
        
        self.delegate?.itemTap(data: data)
    }
}


