//
//  Weight.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-02-27.
//

import Foundation


class Weight: Codable, Equatable {
   
    var ounce: Double
    var pound: Double
    var gram: Double
    var stone: Double
    var stoneP: Double
    var kg: Double
    
    init(ounce: Double = 0, pound: Double = 0, gram: Double = 0, stone: Double = 0, stoneP: Double = 0, kg: Double = 0) {
        
        self.ounce  = ounce
        self.pound  = pound
        self.gram   = gram
        self.stone  = stone
        self.stoneP = stoneP
        self.kg     = kg
    }
    
    func convertOunce(ounce value: Double)  {
        
        let ounce = Measurement(value: value, unit: UnitMass.ounces)
        
        self.ounce = value
        self.pound = ounce.converted(to: .pounds).value
        self.gram  = ounce.converted(to: .grams).value
        self.stone = ounce.converted(to: .stones).value
        self.kg    = ounce.converted(to: .kilograms).value
        
        let remainingStone = Measurement(value: (self.stone - Double(Int(self.stone))), unit: UnitMass.stones)
        self.stoneP   =  remainingStone.converted(to: .pounds).value
    }
    
    func convertPound(pound value: Double)  {
        
        
        let pound = Measurement(value: value, unit: UnitMass.pounds)
        
        self.pound = value
        self.ounce = pound.converted(to: .ounces).value
        self.gram  = pound.converted(to: .grams).value
        self.stone = pound.converted(to: .stones).value
        self.kg    = pound.converted(to: .kilograms).value

        let remainingStone = Measurement(value: (self.stone - Double(Int(self.stone))), unit: UnitMass.stones)
        self.stoneP   =  remainingStone.converted(to: .pounds).value
        
    }
    
    func convertGram(gram value: Double)  {
        
        let gram = Measurement(value: value, unit: UnitMass.grams)
        
        self.gram  = value
        self.ounce = gram.converted(to: .ounces).value
        self.pound = gram.converted(to: .pounds).value
        self.stone = gram.converted(to: .stones).value
        self.kg    = gram.converted(to: .kilograms).value
        
        let remainingStone = Measurement(value: (self.stone - Double(Int(self.stone))), unit: UnitMass.stones)
        self.stoneP   =  remainingStone.converted(to: .pounds).value
    }
    
    func convertStone(stone value: Double)  {
        
        let stone = Measurement(value: value, unit: UnitMass.stones)
        
        self.stone = value
        self.ounce = stone.converted(to: .ounces).value
        self.pound = stone.converted(to: .pounds).value
        self.gram  = stone.converted(to: .grams).value
        self.kg    = stone.converted(to: .kilograms).value
        self.stoneP = 0
        
    }
    
    func convertKg(kg value: Double)  {
        
        let kg = Measurement(value: value, unit: UnitMass.kilograms)
         
        self.kg    = value
        self.ounce = kg.converted(to: .ounces).value
        self.pound = kg.converted(to: .pounds).value
        self.stone = kg.converted(to: .stones).value
        self.gram  = kg.converted(to: .grams).value
        
        let remainingStone = Measurement(value: (self.stone - Double(Int(self.stone))), unit: UnitMass.stones)
        self.stoneP   =  remainingStone.converted(to: .pounds).value
    }
    
    static func == (lhs: Weight, rhs: Weight) -> Bool {
        lhs.gram == rhs.gram
    }
    
}
