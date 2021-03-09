//
//  Speed.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-03-06.
//

import Foundation

class Speed: Codable {
    
    var ms: Double
    var kmh: Double
    var mh: Double
    var knot: Double
    
    init(ms: Double = 0, kmh: Double = 0, mh: Double = 0, knot: Double = 0) {
        
        self.ms   = ms
        self.kmh  = kmh
        self.mh   = mh
        self.knot = knot
        
    }
    
    func convertMs(ms value: Double)  {
        
        let ms = Measurement(value: value, unit: UnitSpeed.metersPerSecond)
        
        self.kmh  = ms.converted(to: .kilometersPerHour).value
        self.mh   = ms.converted(to: .milesPerHour).value
        self.knot = ms.converted(to: .knots).value

    }
    
    func convertKmh(kmh value: Double)  {
        
        let kmh = Measurement(value: value, unit: UnitSpeed.kilometersPerHour)

        self.ms   = kmh.converted(to: .metersPerSecond).value
        self.mh   = kmh.converted(to: .milesPerHour).value
        self.knot = kmh.converted(to: .knots).value
    }
    
    func convertMh(kmh value: Double)  {
        
        let mh = Measurement(value: value, unit: UnitSpeed.milesPerHour)

        self.ms   = mh.converted(to: .metersPerSecond).value
        self.kmh  = mh.converted(to: .kilometersPerHour).value
        self.knot = mh.converted(to: .knots).value
    }
    
    func convertKnot(kmh value: Double)  {
        
        let knot = Measurement(value: value, unit: UnitSpeed.knots)

        self.ms  = knot.converted(to: .metersPerSecond).value
        self.kmh = knot.converted(to: .kilometersPerHour).value
        self.mh  = knot.converted(to: .milesPerHour).value
    }
}
