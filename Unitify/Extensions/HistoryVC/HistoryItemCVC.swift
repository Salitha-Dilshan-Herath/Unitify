//
//  HistoryItemCV.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-03-15.
//

import UIKit

class HistoryItemCVC: UICollectionViewCell {
    
    @IBOutlet weak var viwBack: UIView!
    @IBOutlet weak var lblValueOne: UILabel!
    @IBOutlet weak var lblValueSecond: UILabel!
    

    func setupCell(type: ConvertTypes, data: Any)  {
        
        viwBack.layer.cornerRadius = 8
        viwBack.layer.borderWidth  = 1
        viwBack.layer.borderColor  = UIColor().getNavigationColor().cgColor
        
        switch type {
        
        case .weight:
            
            if let weight = data as? Weight {
                lblValueSecond.text    = "\(Int(weight.gram))g"
                lblValueOne.text = "\(Int(weight.kg))kg"
            }
            
            break
            
        case .temperature:
            
            if let temperature = data as? Temperature {
                lblValueOne.text    = "\(Int(temperature.celsius)) ℃"
                lblValueSecond.text = "\(Int(temperature.fahrenheit)) ℉"
            }
            
            break
            
        case .length:
            
            if let length = data as? Length {
                lblValueOne.text    = "\(Int(length.centimeters))cm"
                lblValueSecond.text = "\(Int(length.meter))m"
            }
            
            break
            
        case .speed:
            
            if let speed = data as? Speed {
                lblValueOne.text    = "\(Int(speed.kmh))kmh"
                lblValueSecond.text = "\(Int(speed.ms))ms"
            }
            
            break
            
        case .volume:
            
            if let volume = data as? Volume {
                lblValueOne.text    = "\(Int(volume.cubicDecimetre))dm³"
                lblValueSecond.text = "\(Int(volume.cubicMetre))m³"
            }
            
            break
            
        case .volumeliquid:
            
            if let liquid = data as? Liquid {
                
                lblValueOne.text    = "\(Int(liquid.millilitre))mm"
                lblValueSecond.text = "\(Int(liquid.litre))l"
                
            }
            
            break
        }
    }
}
