//
//  WeightConvertVC.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-02-07.
//

import UIKit

class WeightConvertVC: UIViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var viwKeyboard: UnitifyKeyboardView!
    @IBOutlet weak var txtOunce: UITextField!
    
    //MARK: - Variables
    var selectedTextField: UITextField?
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: - Custom Method
    
    ///setup ui
    private func setupUI() {
        viwKeyboard.delegate = self
        
        setupTextFields()
    }
    
    private func setupTextFields () {
        txtOunce.text = ""
    }
    
}

///Unitify keyboard delegate implement
extension WeightConvertVC: UnitifyKeyboardViewDelegate {
    
    func numberKeyPress(number: Int) {
        
        guard let textField = self.selectedTextField else { return }
        
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

///Text Field delegate implement
extension WeightConvertVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTextField = textField
    }
}
