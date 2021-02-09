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
            
            let ounce = Measurement(value: value, unit: UnitMass.ounces)
            
            self.poundValue = ounce.converted(to: .pounds).value
            self.gramValue  = ounce.converted(to: .grams).value
            self.stoneValue = ounce.converted(to: .stones).value
            self.kgValue    = ounce.converted(to: .kilograms).value
            
            let remainingStone = Measurement(value: (stoneValue - Double(Int(stoneValue))), unit: UnitMass.stones)
            self.stonePValue   =  remainingStone.converted(to: .pounds).value

            break
        
        case 2:
            
            let pound = Measurement(value: value, unit: UnitMass.pounds)
            
            self.ounceValue = pound.converted(to: .ounces).value
            self.gramValue  = pound.converted(to: .grams).value
            self.stoneValue = pound.converted(to: .stones).value
            self.kgValue    = pound.converted(to: .kilograms).value

            let remainingStone = Measurement(value: (stoneValue - Double(Int(stoneValue))), unit: UnitMass.stones)
            self.stonePValue   =  remainingStone.converted(to: .pounds).value
            
            break
            
        case 3:
            
            let gram = Measurement(value: value, unit: UnitMass.grams)
            
            self.ounceValue = gram.converted(to: .ounces).value
            self.poundValue = gram.converted(to: .pounds).value
            self.stoneValue = gram.converted(to: .stones).value
            self.kgValue    = gram.converted(to: .kilograms).value
            
            let remainingStone = Measurement(value: (stoneValue - Double(Int(stoneValue))), unit: UnitMass.stones)
            self.stonePValue   =  remainingStone.converted(to: .pounds).value

            break
            
        case 4:
            
            let stone = Measurement(value: value, unit: UnitMass.stones)
            
            self.ounceValue = stone.converted(to: .ounces).value
            self.poundValue = stone.converted(to: .pounds).value
            self.gramValue  = stone.converted(to: .grams).value
            self.kgValue    = stone.converted(to: .kilograms).value
            self.stonePValue = 0
            
            break
            
        case 5:
            
        
            
            break
            
        case 6:
            
            let kg = Measurement(value: value, unit: UnitMass.kilograms)
            
            self.ounceValue = kg.converted(to: .ounces).value
            self.poundValue = kg.converted(to: .pounds).value
            self.stoneValue = kg.converted(to: .stones).value
            self.gramValue  = kg.converted(to: .grams).value
            
            let remainingStone = Measurement(value: (stoneValue - Double(Int(stoneValue))), unit: UnitMass.stones)
            self.stonePValue   =  remainingStone.converted(to: .pounds).value

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
