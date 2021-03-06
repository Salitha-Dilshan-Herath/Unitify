//
//  VolumeLiquidVCKeyboard.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-03-04.
//

import Foundation


///Unitify keyboard delegate implement
extension VolumeLiquidVC: UnitifyKeyboardViewDelegate {
    
    func keyPress() {
        
        updateCalculation()
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
    
    func negativeKeyPress() {
        
        guard let textField = self.selectedTextField else { return }
        
        let txt = textField.text!

        if !txt.contains(Constant.NEGATIVE_CHARACTER) {
            textField.text!.insert(contentsOf: Constant.NEGATIVE_CHARACTER, at: txt.startIndex)
        }
    }
}
