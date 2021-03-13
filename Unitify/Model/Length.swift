//
//  Length.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-03-06.
//

import Foundation

class Length: Codable, Equatable {
    
    var meter: Double
    var kilometer: Double
    var mile: Double
    var centimeters: Double
    var millimeter: Double
    var yard: Double
    var inch: Double
    
    
    init(meter: Double = 0, kilometer: Double = 0, mile: Double = 0, centimeters: Double = 0, millimeter:Double = 0, yard: Double = 0, inch: Double = 0) {
        
        self.meter       = meter
        self.kilometer   = kilometer
        self.mile        = mile
        self.centimeters = centimeters
        self.millimeter  = millimeter
        self.yard        = yard
        self.inch        = inch
    }
    
    func convertMeter(meter value: Double)  {
        
        let meter = Measurement(value: value, unit: UnitLength.meters)
        
        self.meter       = value
        self.kilometer   = meter.converted(to: .kilometers).value
        self.mile        = meter.converted(to: .miles).value
        self.centimeters = meter.converted(to: .centimeters).value
        self.millimeter  = meter.converted(to: .millimeters).value
        self.yard        = meter.converted(to: .yards).value
        self.inch        = meter.converted(to: .inches).value
    
    }
    
    func convertKm(km value: Double)  {
        
        let km = Measurement(value: value, unit: UnitLength.kilometers)
        
        self.kilometer   = value
        self.meter       = km.converted(to: .meters).value
        self.mile        = km.converted(to: .miles).value
        self.centimeters = km.converted(to: .centimeters).value
        self.millimeter  = km.converted(to: .millimeters).value
        self.yard        = km.converted(to: .yards).value
        self.inch        = km.converted(to: .inches).value
    
    }
    
    func convertMile(mile value: Double)  {
        
        let mile = Measurement(value: value, unit: UnitLength.miles)
        
        self.mile        = value
        self.meter       = mile.converted(to: .meters).value
        self.kilometer   = mile.converted(to: .kilometers).value
        self.centimeters = mile.converted(to: .centimeters).value
        self.millimeter  = mile.converted(to: .millimeters).value
        self.yard        = mile.converted(to: .yards).value
        self.inch        = mile.converted(to: .inches).value
    
    }
    
    func convertCm(meter value: Double)  {
        
        let cm = Measurement(value: value, unit: UnitLength.centimeters)
        
        self.centimeters = value
        self.kilometer   = cm.converted(to: .kilometers).value
        self.mile        = cm.converted(to: .miles).value
        self.meter       = cm.converted(to: .meters).value
        self.millimeter  = cm.converted(to: .millimeters).value
        self.yard        = cm.converted(to: .yards).value
        self.inch        = cm.converted(to: .inches).value
    
    }
    
    func convertMm(meter value: Double)  {
        
        let mm = Measurement(value: value, unit: UnitLength.millimeters)
        
        self.millimeter  = value
        self.kilometer   = mm.converted(to: .kilometers).value
        self.mile        = mm.converted(to: .miles).value
        self.meter       = mm.converted(to: .meters).value
        self.centimeters = mm.converted(to: .centimeters).value
        self.yard        = mm.converted(to: .yards).value
        self.inch        = mm.converted(to: .inches).value
    
    }
    
    func convertYard(yard value: Double)  {
        
        let yard = Measurement(value: value, unit: UnitLength.yards)
        
        self.yard        = value
        self.kilometer   = yard.converted(to: .kilometers).value
        self.mile        = yard.converted(to: .miles).value
        self.centimeters = yard.converted(to: .centimeters).value
        self.millimeter  = yard.converted(to: .millimeters).value
        self.meter       = yard.converted(to: .meters).value
        self.inch        = yard.converted(to: .inches).value
    
    }
    
    func convertInch(meter value: Double)  {
        
        let inch = Measurement(value: value, unit: UnitLength.inches)
        
        self.inch        = value
        self.kilometer   = inch.converted(to: .kilometers).value
        self.mile        = inch.converted(to: .miles).value
        self.centimeters = inch.converted(to: .centimeters).value
        self.millimeter  = inch.converted(to: .millimeters).value
        self.yard        = inch.converted(to: .yards).value
        self.meter       = inch.converted(to: .meters).value
    
    }
    
    static func == (lhs: Length, rhs: Length) -> Bool {
       return lhs.centimeters == rhs.centimeters
    }
    
}
