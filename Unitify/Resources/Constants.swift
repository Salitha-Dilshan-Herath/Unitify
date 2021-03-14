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
    static let VOLUME_CONVERTER_SEGUE_IDENTIFY      = "voulme"
    static let LIQUID_CONVERTER_SEGUE_IDENTIFY      = "liquid"
    static let SPEED_CONVERTER_SEGUE_IDENTIFY       = "speed"
    static let LENGTH_CONVERTER_SEGUE_IDENTIFY      = "length"

    static let KEYBOARD_NIB_NAME = "UniitifyKeyboard"
    
    static let DECIMAL_CHARACTER  = "."
    static let NEGATIVE_CHARACTER = "-"
    
    static var NUMBER_OF_DECIMAL_PLACES = 2
    static var IS_AUTO_SAVE = true
    static var SETTING_NUMBER_OF_DECIMAL_PLACES = "com.Unitify.SETTING_NUMBER_OF_DECIMAL_PLACES"
    static var SETTING_IS_AUTO_SAVE             = "com.Unitify.SETTING_IS_AUTO_SAVE"

    static let SESSION_MANAGER_STORE_WEIGHT_DATA      = "com.Unitify.SESSION_MANAGER_STORE_WEIGHT_DATA"
    static let SESSION_MANAGER_STORE_TEMPERATURE_DATA = "com.Unitify.SESSION_MANAGER_STORE_TEMPERATURE_DATA"
    static let SESSION_MANAGER_STORE_VOLUME_DATA      = "com.Unitify.SESSION_MANAGER_STORE_VOLUME_DATA"
    static let SESSION_MANAGER_STORE_LIQUID_DATA      = "com.Unitify.SESSION_MANAGER_STORE_LIQUID_DATA"
    static let SESSION_MANAGER_STORE_SPEED_DATA       = "com.Unitify.SESSION_MANAGER_STORE_SPEED_DATA"
    static let SESSION_MANAGER_STORE_LENGTH_DATA      = "com.Unitify.SESSION_MANAGER_STORE_LENGTH_DATA"

    static let HISTORY_MANAGER_STORE_WEIGHT_DATA      = "com.Unitify.HISTORY_MANAGER_STORE_WEIGHT_DATA"
    static let HISTORY_MANAGER_STORE_TEMPERATURE_DATA = "com.Unitify.HISTORY_MANAGER_STORE_TEMPERATURE_DATA"
    static let HISTORY_MANAGER_STORE_VOLUME_DATA      = "com.Unitify.HISTORY_MANAGER_STORE_VOLUME_DATA"
    static let HISTORY_MANAGER_STORE_LIQUID_DATA      = "com.Unitify.HISTORY_MANAGER_STORE_LIQUID_DATA"
    static let HISTORY_MANAGER_STORE_SPEED_DATA       = "com.Unitify.HISTORY_MANAGER_STORE_SPEED_DATA"
    static let HISTORY_MANAGER_STORE_LENGTH_DATA      = "com.Unitify.HISTORY_MANAGER_STORE_LENGTH_DATA"
    
    static let ALERT_HEADER = "Unitify"
    static let HISTORY_DATA_SAVE_SUCCESS    =  "Calculation saved in history successfully."
    static let HISTORY_DATA_ALREADY_EXISTS  =  "This calculation is already saved. Please try another calculation."

}
