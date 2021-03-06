//
//  ConvertMethodsTBV.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-02-06.
//

import Foundation
import UIKit

extension ConvertMethodsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return methods.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.UNITS_METHODS_TABLE_IDENTIFY, for: indexPath) as! MethodTC
        
        let data = methods[indexPath.row]
        
        cell.lblMethodName.text = data.rawValue
        cell.imgMethod.image    = UIImage(named: "\(data.rawValue)")
        cell.selectionStyle     = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return tableView.frame.height / 6
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = methods[indexPath.row]

        self.selectedConvertType = data

        switch self.selectedConvertType {
      
        case .weight:
            
            self.performSegue(withIdentifier: Constant.WEIGHT_CONVERTER_SEGUE_IDENTIFY, sender: nil)

        case .temperature:
            
            self.performSegue(withIdentifier: Constant.TEMPERATURE_CONVERTER_SEGUE_IDENTIFY, sender: nil)

        case .length:
            break
        case .speed:
            break
        case .volume:
            break
        case .volumeliquid:
            
            self.performSegue(withIdentifier: Constant.LIQUID_CONVERTER_SEGUE_IDENTIFY, sender: nil)

            
            break
        }
    }
    
}
