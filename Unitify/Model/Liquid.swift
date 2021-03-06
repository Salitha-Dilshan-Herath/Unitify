//
//  Liquid.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-03-04.
//

import Foundation

class Liquid: Codable {
    
    var gallon: Double
    var litre: Double
    var pint: Double
    var fluid: Double
    var millilitre: Double
    
    init(gallon: Double = 0, litre: Double = 0, pint: Double = 0, fluid: Double = 0, millilitre: Double = 0) {
        
        self.gallon = gallon
        self.litre  = litre
        self.pint   = pint
        self.fluid  = fluid
        self.millilitre = millilitre
    }
    
    func convertGallon(gallon value: Double)  {
        
        let gallon = Measurement(value: value, unit: UnitVolume.imperialGallons)
        
        self.litre = gallon.converted(to: .liters).value
        self.pint  = gallon.converted(to: .imperialPints).value
        self.fluid = gallon.converted(to: .fluidOunces).value
        self.millilitre = gallon.converted(to: .milliliters).value

    }
    
    func convertLitre(litre value: Double)  {
        
        let litre = Measurement(value: value, unit: UnitVolume.liters)
        
        self.gallon = litre.converted(to: .imperialGallons).value
        self.pint   = litre.converted(to: .imperialPints).value
        self.fluid  = litre.converted(to: .fluidOunces).value
        self.millilitre = litre.converted(to: .milliliters).value

    }
    
    func convertPint(pint value: Double)  {
        
        let pint = Measurement(value: value, unit: UnitVolume.imperialPints)
        
        self.gallon = pint.converted(to: .imperialGallons).value
        self.litre  = pint.converted(to: .liters).value
        self.fluid  = pint.converted(to: .fluidOunces).value
        self.millilitre = pint.converted(to: .milliliters).value

    }
    
    func convertFluid(pint value: Double)  {
        
        let fluid = Measurement(value: value, unit: UnitVolume.fluidOunces)
        
        self.gallon = fluid.converted(to: .imperialGallons).value
        self.litre  = fluid.converted(to: .liters).value
        self.pint   = fluid.converted(to: .imperialPints).value
        self.millilitre = fluid.converted(to: .milliliters).value

    }
    
    func convertMillilitre(ml value: Double)  {
        
        let ml = Measurement(value: value, unit: UnitVolume.milliliters)
        
        self.gallon = ml.converted(to: .imperialGallons).value
        self.litre  = ml.converted(to: .liters).value
        self.pint   = ml.converted(to: .imperialPints).value
        self.fluid  = ml.converted(to: .fluidOunces).value

    }

    
}
