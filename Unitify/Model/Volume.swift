//
//  Volume.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-03-13.
//

import Foundation

class Volume: Codable, Equatable {
    
    var cubicCentimetre: Double
    var cubicMetre: Double
    var cubicDecimetre: Double
    
    init(cubiccentimetre: Double = 0, cubicmetre: Double = 0, cubicdecimetre: Double = 0) {
        
        self.cubicCentimetre = cubiccentimetre
        self.cubicMetre      = cubicmetre
        self.cubicDecimetre  = cubicdecimetre
        
    }
    
    func convertCubicCentimeter(cm value: Double)  {
        
        let cm = Measurement(value: value, unit: UnitVolume.cubicCentimeters)

        self.cubicCentimetre = value
        self.cubicMetre      = cm.converted(to: .cubicMeters).value
        self.cubicDecimetre  = cm.converted(to: .cubicDecimeters).value
        
    }
    
    func convertCubicMeter(m value: Double)  {
        
        let m = Measurement(value: value, unit: UnitVolume.cubicMeters)

        self.cubicMetre      = value
        self.cubicCentimetre = m.converted(to: .cubicCentimeters).value
        self.cubicDecimetre  = m.converted(to: .cubicDecimeters).value

    }
    
    func convertCubicDecimeter(cd value: Double) {
        
        let cd = Measurement(value: value, unit: UnitVolume.cubicDecimeters)

        self.cubicDecimetre  = value
        self.cubicMetre      = cd.converted(to: .cubicMeters).value
        self.cubicMetre      = cd.converted(to: .cubicMeters).value

    }
    
    static func == (lhs: Volume, rhs: Volume) -> Bool {
        return lhs.cubicCentimetre == rhs.cubicCentimetre
    }
    
}
