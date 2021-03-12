//
//  Alert.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-03-12.
//

import Foundation
import UIKit

struct Alert {
    
    private static func showBasicAlert(on vc:UIViewController, with title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async { vc.present(alert, animated: true, completion: nil) }
    }

    static func showMessage(msg: String,on vc:UIViewController){
        showBasicAlert(on: vc, with:Constant.ALERT_HEDER, message: msg)
    }
}
