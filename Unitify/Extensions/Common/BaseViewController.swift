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
    
    func textFieldTap()  {
        
    }
    
    func keyBoardDoneKeyPress() {
        
    }
 
}

///Text Field delegate implement
extension BaseViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTextField = textField
        textFieldTap()

        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (string.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil) {
            return true
        }
        
        return  false
    }
}
