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
    @IBOutlet weak var txtPound: CustomTextField!
    @IBOutlet weak var txtGram: CustomTextField!
    @IBOutlet weak var txtStone: CustomTextField!
    @IBOutlet weak var txtSpound: CustomTextField!
    @IBOutlet weak var txtKg: CustomTextField!
    
    //MARK: - Variables
    var selectedTextField: UITextField?
    
    var ounceValue: Double = 0.0 {
        didSet {
            txtOunce.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", ounceValue)
        }
    }
    
    var poundValue: Double = 0.0 {
        didSet {
            txtPound.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", poundValue)
        }
    }
    
    var gramValue: Double = 0.0 {
        didSet {
            txtGram.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", gramValue)
        }
    }
    
    var stoneValue: Double = 0.0 {
        didSet {
            txtStone.text = String(format:"%.f", stoneValue)
        }
    }
    
    var kgValue: Double = 0.0 {
        didSet {
            txtKg.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", kgValue)
        }
    }
    
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
    
    func updateCalculation() {
        
        guard let textField = self.selectedTextField else { return }
        
        let value = (textField.text! as NSString).doubleValue
        
        switch textField.tag {
        
        case 1:
            
            let ounce = Measurement(value: value, unit: UnitMass.ounces)
            
            self.poundValue = ounce.converted(to: .pounds).value
            self.gramValue  = ounce.converted(to: .grams).value
            self.stoneValue = ounce.converted(to: .stones).value
            self.kgValue    = ounce.converted(to: .kilograms).value
          
            break
            
        default:
            break
            
        }
    }
}


///Text Field delegate implement
extension WeightConvertVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTextField = textField
    }
}
