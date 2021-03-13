//
//  Temperature.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-02-27.
//

import Foundation

class Temperature: Codable, Equatable {

    var celsius: Double 
    var fahrenheit: Double
    var kelvin: Double

    init(celsius: Double = 0, fahrenheit: Double = 0, kelvin: Double = 0) {
        self.celsius = celsius
        self.fahrenheit = fahrenheit
        self.kelvin = kelvin
    }
    
    func convertCelsius(celsius value: Double) {
        
        let celsius = Measurement(value: value, unit: UnitTemperature.celsius)

        self.celsius    = value
        self.fahrenheit = celsius.converted(to: .fahrenheit).value
        self.kelvin     = celsius.converted(to: .kelvin).value
    }
    
    func convertFahrenheit(fahrenheit value: Double) {
        
        let fahrenheit = Measurement(value: value, unit: UnitTemperature.fahrenheit)
        
        self.fahrenheit = value
        self.celsius    = fahrenheit.converted(to: .celsius).value
        self.kelvin     = fahrenheit.converted(to: .kelvin).value
    }
    
    func convertKelvin(kelvin value: Double) {
        
        let kelvin = Measurement(value: value, unit: UnitTemperature.kelvin)
        
        self.kelvin     = value
        self.celsius    = kelvin.converted(to: .celsius).value
        self.fahrenheit = kelvin.converted(to: .fahrenheit).value
    }
    
    static func == (lhs: Temperature, rhs: Temperature) -> Bool {
        return lhs.celsius == rhs.celsius
    }
    
    
}
