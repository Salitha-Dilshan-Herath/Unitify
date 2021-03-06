//
//  Temperature.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-02-14.
//

import UIKit

class TemperatureVC: UIViewController {

    //MARK: - @IBOutlet
    @IBOutlet weak var txtCelsius: CustomTextField!
    @IBOutlet weak var txtFahrenheit: CustomTextField!
    @IBOutlet weak var txtKelvin: CustomTextField!
    @IBOutlet weak var viwKeyboard: UnitifyKeyboardView!

    //MARK: - Variables
    var selectedTextField: UITextField?
    var temperature: Temperature = Temperature()
    
    var celsiusValue: Double = 0.0 {
        didSet {
            txtCelsius.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", celsiusValue)
        }
    }
    
    var fahrenheitValue: Double = 0.0 {
        didSet {
            txtFahrenheit.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", fahrenheitValue)
        }
    }
    
    var kelvinValue: Double = 0.0 {
        didSet {
            txtKelvin.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", kelvinValue)
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
        txtCelsius.text    = ""
        txtFahrenheit.text = ""
        txtKelvin.text     = ""
        
    }
    
    func updateCalculation() {
        
        guard let textField = self.selectedTextField else { return }
        
        let value = (textField.text! as NSString).doubleValue
        
        switch textField.tag {
        
        case 1:
                        
            temperature.convertCelsius(celsius: value)
            self.fahrenheitValue = temperature.fahrenheit
            self.kelvinValue     = temperature.kelvin
        
            break
        
        case 2:
            
            temperature.convertFahrenheit(fahrenheit: value)
            self.celsiusValue = temperature.celsius
            self.kelvinValue  = temperature.kelvin
            
            break
            
        case 3:
            

            temperature.convertKelvin(kelvin: value)
            self.celsiusValue    = temperature.celsius
            self.fahrenheitValue = temperature.fahrenheit
           
            break
            
            
        default:
            break
            
        }
    }
}

///Text Field delegate implement
extension TemperatureVC: UITextFieldDelegate {
    
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
