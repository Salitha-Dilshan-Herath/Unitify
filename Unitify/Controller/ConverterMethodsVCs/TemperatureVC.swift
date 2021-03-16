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
    
    //MARK: - @IBActions
    @IBAction func saveBtnTap(_ sender: Any) {
        
        if self.temperature.celsius == 0 && self.temperature.fahrenheit == 0{
            Alert.showMessage(msg: Constant.HISTORY_DATA_ZERO_CANT_STORE, on: self)
            return
        }
        
        if let history_data = UserDefaultsManager.getObject(type: [Temperature].self, key: Constant.HISTORY_MANAGER_STORE_TEMPERATURE_DATA){
         
            if history_data.contains(where: {$0  == self.temperature}) {
                
                Alert.showMessage(msg: Constant.HISTORY_DATA_ALREADY_EXISTS, on: self)
                
            } else {
                
                self.saveHistoryData(data: self.temperature, type: [Temperature].self, key: Constant.HISTORY_MANAGER_STORE_TEMPERATURE_DATA)
            }
        } else {
            self.saveHistoryData(data: self.temperature, type: [Temperature].self, key: Constant.HISTORY_MANAGER_STORE_TEMPERATURE_DATA)
        }
    }
    
    @IBAction func refreshBtnTap(_ sender: Any) {
         
         UserDefaultsManager.removeObject(key: Constant.SESSION_MANAGER_STORE_TEMPERATURE_DATA)
         
         self.temperature = Temperature()
         
         self.celsiusValue  = 0
         self.fahrenheitValue  = 0
         self.kelvinValue   = 0
      
     }
    
    //MARK: - Custom Method
    
    ///setup ui
    private func setupUI() {
        self.viwKeyboard.delegate = self

        self.backgroundNotification()
        self.loadSessionData()
    }
    
    private func loadSessionData () {
        
        if !Constant.IS_AUTO_SAVE{
            return
        }
        
        guard let history_temp = UserDefaultsManager.getObject(type: Temperature.self, key: Constant.SESSION_MANAGER_STORE_TEMPERATURE_DATA) else {
            return
        }
        
        self.temperature = history_temp
        self.celsiusValue    = history_temp.celsius
        self.kelvinValue     = history_temp.kelvin
        self.fahrenheitValue = history_temp.fahrenheit

        UserDefaultsManager.removeObject(key: Constant.SESSION_MANAGER_STORE_TEMPERATURE_DATA)
    }
    
    override func saveBackgroundData() {
        
        if (self.temperature.celsius == 0 && self.temperature.kelvin == 0 ) || !Constant.IS_AUTO_SAVE{
            return
        }
        
        UserDefaultsManager.saveObject(data: self.temperature, key: Constant.SESSION_MANAGER_STORE_TEMPERATURE_DATA)
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
        } else {
            textField.text!.removeFirst()
        }
        
    }
    
    /// keyboard done key press event
    override func doneKeyPress() {
        isKeyBoardShow.toggle()
    }
    
    /// textfield tap trigger function
    override func textFieldTap() {
        
        if !isKeyBoardShow {
            isKeyBoardShow.toggle()
        }
    }

}

