//
//  HisotryTBV.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-03-14.
//

import Foundation
import UIKit

extension HistoryVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return methods.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.UNITS_METHODS_TABLE_IDENTIFY, for: indexPath) as! HistoryMethodTC
        
        
        let data = methods[indexPath.row]
        
        cell.lblMethodName.text = data.rawValue
        cell.imgMethod.image    = UIImage(named: "\(data.rawValue)")
        cell.selectedType       = data
        cell.setupCell()
        cell.delegate           = self
        cell.selectionStyle     = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if selectedCell == indexPath.row {
            return 250
        }
        
        return 95
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
              
        let cell = tableView.cellForRow(at: indexPath) as! HistoryMethodTC

        
        if self.selectedCell == indexPath.row {
             
            self.selectedCell = -1
            cell.rotateArrow(isExpand: false)

        }else {
            cell.rotateArrow(isExpand: true)
            self.selectedCell = indexPath.row
        }
        
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
}
