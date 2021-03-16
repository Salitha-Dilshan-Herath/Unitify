//
//  HistoryManager.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-03-10.
//

import Foundation
import UIKit


struct UserDefaultsManager {
    
    
    private static var userDefaults = UserDefaults.standard
    private static let encoder = JSONEncoder()
    private static let decoder = JSONDecoder()
    
    
    static func save(data: Any, key: String)  {
        
        userDefaults.setValue(data, forKey: key)
    }
    
    static func getString(key: String) -> String?  {
        
        if  userDefaults.object(forKey: key) == nil {
            return nil
        }
        
        return userDefaults.string(forKey: key)
    }
    
    static func getInt(key: String) -> Int?  {
        
        if  userDefaults.object(forKey: key) == nil {
            return nil
        }
        
        return userDefaults.integer(forKey: key)
    }
    
    static func getBool(key: String) -> Bool?  {
        
        if  userDefaults.object(forKey: key) == nil {
            return nil
        }
        
        return userDefaults.bool(forKey: key)
    }
    
    static func saveObject<T: Codable>(data: T, key: String)  {
        
        do {
            
            let en_data = try encoder.encode(data)
            userDefaults.set(en_data, forKey: key)
            
        } catch {
            print("Unable to Encode (\(error))")
        }
    }
    
    static func getObject<T: Codable>(type: T.Type, key: String) -> T? {
        
        if let data = userDefaults.data(forKey: key) {
            do {
                
                return try decoder.decode(type, from: data)
                
            } catch {
                print("Unable to Decode (\(error))")
            }
        }
        
        return nil
    }
    
    static func removeObject(key: String) {
        
        userDefaults.removeObject(forKey: key)
    }
    
}
