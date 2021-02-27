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
    @IBOutlet weak var txtOunce: CustomTextField!
    @IBOutlet weak var txtPound: CustomTextField!
    @IBOutlet weak var txtGram: CustomTextField!
    @IBOutlet weak var txtStone: CustomTextField!
    @IBOutlet weak var txtSpound: CustomTextField!
    @IBOutlet weak var txtKg: CustomTextField!
    
    //MARK: - Variables
    var selectedTextField: UITextField?
    var weight = Weight()
    
    var ounceValue: Double = 0.0 {
        didSet {
            txtOunce.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f oz", ounceValue)
        }
    }
    
    var poundValue: Double = 0.0 {
        didSet {
            txtPound.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f lb", poundValue)
        }
    }
    
    var gramValue: Double = 0.0 {
        didSet {
            txtGram.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f g", gramValue)
        }
    }
    
    var stoneValue: Double = 0.0 {
        didSet {
            
            txtStone.text = "\(Int(stoneValue)) st"
        }
    }
    
    var stonePValue: Double = 0.0 {
        didSet {
            
            txtSpound.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f lb", stonePValue)
        }
    }
    
    var kgValue: Double = 0.0 {
        didSet {
            txtKg.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f kg", kgValue)
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
                        
            weight.convertOunce(ounce: value)
            
            self.poundValue  = weight.pound
            self.gramValue   = weight.gram
            self.stoneValue  = weight.stone
            self.kgValue     = weight.kg
            self.stonePValue =  weight.stoneP

            break
        
        case 2:
                        
            weight.convertPound(pound: value)
            
            self.ounceValue  = weight.ounce
            self.gramValue   = weight.gram
            self.stoneValue  = weight.stone
            self.kgValue     = weight.kg
            self.stonePValue =  weight.stoneP
            
            break
            
        case 3:
            
            weight.convertGram(gram: value)
            
            self.ounceValue  = weight.ounce
            self.poundValue  = weight.pound
            self.stoneValue  = weight.stone
            self.kgValue     = weight.kg
            self.stonePValue =  weight.stoneP

            break
            
        case 4:
            
            weight.convertStone(stone: value)
            
            self.ounceValue  = weight.ounce
            self.poundValue  = weight.pound
            self.gramValue   = weight.gram
            self.kgValue     = weight.kg
            self.stonePValue = weight.stoneP
            
            break
            
            
        case 6:
                        
            weight.convertKg(kg: value)
            
            self.ounceValue  = weight.ounce
            self.poundValue  = weight.pound
            self.stoneValue  = weight.stone
            self.gramValue   = weight.gram
            self.stonePValue =  weight.stoneP

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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (string.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil) {
            return true
        }
        
        return  false
    }
}
