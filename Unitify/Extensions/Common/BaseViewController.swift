//
//  BaseViewController.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-03-06.
//

import Foundation
import UIKit

class BaseViewController: UIViewController, UnitifyKeyboardViewDelegate {
    
    
    var selectedTextField: UITextField?
    
    ///MARK: -  Keyboard delegate functions
    func keyPress() {
        
    }
    
    func negativeKeyPress() {
        
    }
    
    func numberKeyPress(number: Int) {
        
        guard let textField = self.selectedTextField else { return }
        
        if textField.text!.contains(Constant.DECIMAL_CHARACTER) {
            
            if textField.text!.components(separatedBy: Constant.DECIMAL_CHARACTER)[1].count == Constant.NUMBER_OF_DECIMAL_PLACES {
                
                return
                
            }
        }
        
        textField.text! += "\(number)"
    }
    
    func decimalKeyPress() {
        
        guard let textField = self.selectedTextField else { return }
        
        let txt = textField.text!
        
        if !txt.contains(Constant.DECIMAL_CHARACTER) {
            textField.text! += Constant.DECIMAL_CHARACTER
        }
    }
    
    func clearKeyPress() {
        
        guard let textField = self.selectedTextField else { return }
        
        if textField.text!.count > 0 {
            textField.text!.removeLast()
        }
    }
    
    func doneKeyPress() {
        
    }
    
    ///MARK: - Text Field Tap Function
    func textFieldTap()  {
        
    }
    
    ///MARK: - Background task manager
    func backgroundNotification()  {
        
        let notificationCenter = NotificationCenter.default
           notificationCenter.addObserver(self, selector: #selector(saveBackgroundData), name: UIApplication.willResignActiveNotification, object: nil)
        
    }
 
    @objc func saveBackgroundData() {
    }
    
    func saveHistoryData<T: Codable>(data: T, type: [T].Type, key: String)  {
        
        if var history_data = UserDefaultsManager.getObject(type: type.self, key: key){
         
            if history_data.count == 5 {
                history_data.removeFirst()
            }
            
            history_data.append(data)
            UserDefaultsManager.saveObject(data: history_data, key: key)
            
        } else {
            UserDefaultsManager.saveObject(data: [data], key: key)
        }
        
        Alert.showMessage(msg: Constant.HISTORY_DATA_SAVE_SUCCESS, on: self)

    }
}

///Text Field delegate implement
extension BaseViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTextField = textField
        textFieldTap()

        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (string.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil) {
            return true
        }
        
        return  false
    }
}
