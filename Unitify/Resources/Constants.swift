//
//  Constants.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-02-06.
//

import Foundation

struct Constant {
    
    static let UNITS_METHODS_TABLE_IDENTIFY         = "method"
    static let WEIGHT_CONVERTER_SEGUE_IDENTIFY      = "weight"
    static let TEMPERATURE_CONVERTER_SEGUE_IDENTIFY = "temperature"
    static let LIQUID_CONVERTER_SEGUE_IDENTIFY      = "liquid"
    static let SPEED_CONVERTER_SEGUE_IDENTIFY       = "speed"
    static let LENGTH_CONVERTER_SEGUE_IDENTIFY      = "length"

    static let KEYBOARD_NIB_NAME = "UniitifyKeyboard"
    
    static let DECIMAL_CHARACTER  = "."
    static let NEGATIVE_CHARACTER = "-"
    
    static var NUMBER_OF_DECIMAL_PLACES = 2

    static let SESSION_MANAGER_STORE_WEIGHT_DATA      = "com.Unitify.SESSION_MANAGER_STORE_WEIGHT_DATA"
    static let SESSION_MANAGER_STORE_TEMPERATURE_DATA = "com.Unitify.SESSION_MANAGER_STORE_TEMPERATURE_DATA"
    static let SESSION_MANAGER_STORE_LIQUID_DATA      = "com.Unitify.SESSION_MANAGER_STORE_LIQUID_DATA"
    static let SESSION_MANAGER_STORE_SPEED_DATA       = "com.Unitify.SESSION_MANAGER_STORE_SPEED_DATA"
    static let SESSION_MANAGER_STORE_LENGTH_DATA      = "com.Unitify.SESSION_MANAGER_STORE_LENGTH_DATA"

    static let HISTORY_MANAGER_STORE_WEIGHT_DATA      = "com.Unitify.HISTORY_MANAGER_STORE_WEIGHT_DATA"
    static let HISTORY_MANAGER_STORE_TEMPERATURE_DATA = "com.Unitify.HISTORY_MANAGER_STORE_TEMPERATURE_DATA"
    static let HISTORY_MANAGER_STORE_LIQUID_DATA      = "com.Unitify.HISTORY_MANAGER_STORE_LIQUID_DATA"
    static let HISTORY_MANAGER_STORE_SPEED_DATA       = "com.Unitify.HISTORY_MANAGER_STORE_SPEED_DATA"
    static let HISTORY_MANAGER_STORE_LENGTH_DATA      = "com.Unitify.HISTORY_MANAGER_STORE_LENGTH_DATA"
    
    static let ALERT_HEDER = "Unitify"
}
