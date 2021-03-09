//
//  Temperature.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-02-14.
//

import UIKit

class TemperatureVC: BaseViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var txtCelsius: CustomTextField!
    @IBOutlet weak var txtFahrenheit: CustomTextField!
    @IBOutlet weak var txtKelvin: CustomTextField!
    @IBOutlet weak var viwKeyboard: UnitifyKeyboardView!
    @IBOutlet weak var constraintKeyBoardBottom: NSLayoutConstraint!
    
    //MARK: - Variables
    
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
    
    var isKeyBoardShow: Bool = false {
        
        didSet {
            
            if isKeyBoardShow {
                
                UIView.animate(withDuration: Double(0.5), animations: {
                    self.constraintKeyBoardBottom.constant = 0
                    self.view.layoutIfNeeded()
                })
                
                
                
            } else {
                
                UIView.animate(withDuration: Double(0.5), animations: {
                    self.constraintKeyBoardBottom.constant = -1000
                    self.view.layoutIfNeeded()
                })
                
            }
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
    
    /// keyboard key press event
    override func keyPress() {
        
        updateCalculation()
        
    }
    
    /// keyboard negative key press event
    override func negativeKeyPress() {
        
        guard let textField = self.selectedTextField else { return }
        
        let txt = textField.text!
        
        if !txt.contains(Constant.NEGATIVE_CHARACTER) {
            textField.text!.insert(contentsOf: Constant.NEGATIVE_CHARACTER, at: txt.startIndex)
        }
        
    }
    
    override func textFieldTap() {
        
        if !isKeyBoardShow {
            isKeyBoardShow.toggle()
        }
    }
    
    override func keyBoardDoneKeyPress() {
        isKeyBoardShow.toggle()
    }
}

