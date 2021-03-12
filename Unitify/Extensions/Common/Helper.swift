//
//  Helper.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-03-12.
//

import Foundation

struct Helper {
    
    static func isAvailable<T: Comparable> (data: T, list: [T]) -> Bool {
        
        return list.contains(where: { $0 == data})
    }
}
