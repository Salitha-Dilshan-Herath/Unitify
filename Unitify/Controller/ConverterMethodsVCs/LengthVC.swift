//
//  LengthVC.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-03-06.
//

import UIKit

class LengthVC: BaseViewController {
    
    
    @IBOutlet weak var viwKeyboard: UnitifyKeyboardView!
    @IBOutlet weak var txtMeter: CustomTextField!
    @IBOutlet weak var txtKm: CustomTextField!
    @IBOutlet weak var txtMile: CustomTextField!
    @IBOutlet weak var txtCm: CustomTextField!
    @IBOutlet weak var txtMm: CustomTextField!
    @IBOutlet weak var txtYard: CustomTextField!
    @IBOutlet weak var txtInch: CustomTextField!
    @IBOutlet weak var viwScrolle: UIScrollView!
    @IBOutlet weak var constraintTxtFieldViw: NSLayoutConstraint!
    @IBOutlet weak var constraintKeyBoardBottom: NSLayoutConstraint!
    
    //MARK: - Variables
    var length: Length = Length()
    
    var meterValue: Double = 0.0 {
        didSet {
            txtMeter.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", meterValue)
        }
    }
    
    var kilometerValue: Double = 0.0 {
        didSet {
            txtKm.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", kilometerValue)
        }
    }
    
    var mileValue: Double = 0.0 {
        didSet {
            txtMile.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", mileValue)
        }
    }
    
    var centimetersValue: Double = 0.0 {
        didSet {
            txtCm.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", centimetersValue)
        }
    }
    
    var millimeterValue: Double = 0.0 {
        didSet {
            txtMm.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", millimeterValue)
        }
    }
    
    var yardValue: Double = 0.0 {
        didSet {
            txtYard.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", yardValue)
        }
    }
    
    var inchValue: Double = 0.0 {
        didSet {
            txtInch.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", inchValue)
        }
    }
    
    var isKeyBoardShow: Bool = false {
        
        didSet {
            
            if isKeyBoardShow {
                
                UIView.animate(withDuration: Double(0.5), animations: {
                    self.constraintKeyBoardBottom.constant = 0
                    self.view.layoutIfNeeded()
                })
                
                let extraValue = constraintTxtFieldViw.constant - ( self.view.frame.height / 2 )
                
                if extraValue > 0 {
                    self.viwScrolle.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + extraValue)
                }
                
            } else {
                
                UIView.animate(withDuration: Double(0.5), animations: {
                    self.constraintKeyBoardBottom.constant = -1000
                    self.view.layoutIfNeeded()
                })
                
                self.viwScrolle.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
                
                
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
        
        if (self.length.centimeters == 0 && self.length.kilometer == 0){
            Alert.showMessage(msg: Constant.HISTORY_DATA_ZERO_CANT_STORE, on: self)
            return
        }
        
        if let history_data = UserDefaultsManager.getObject(type: [Length].self, key: Constant.HISTORY_MANAGER_STORE_LENGTH_DATA){
         
            if history_data.contains(where: {$0  == self.length}) {
                
                Alert.showMessage(msg: Constant.HISTORY_DATA_ALREADY_EXISTS, on: self)
                
            } else {
                
                self.saveHistoryData(data: self.length, type: [Length].self, key: Constant.HISTORY_MANAGER_STORE_LENGTH_DATA)
            }
        } else {
            self.saveHistoryData(data: self.length, type: [Length].self, key: Constant.HISTORY_MANAGER_STORE_LENGTH_DATA)
        }
    }
    
    @IBAction func refreshBtnTap(_ sender: Any) {
        
        UserDefaultsManager.removeObject(key: Constant.SESSION_MANAGER_STORE_LENGTH_DATA)
        
        self.length = Length()
        
        self.meterValue  = 0
        self.kilometerValue  = 0
        self.mileValue   = 0
        self.centimetersValue  = 0
        self.millimeterValue = 0
        self.yardValue     = 0
        self.inchValue     = 0
    }
    
    //MARK: - Custom Method
    
    ///setup ui
    private func setupUI() {
        self.viwKeyboard.delegate = self
        self.isKeyBoardShow = false
        
        self.backgroundNotification()
        self.loadSessionData()
        
    }
    
    private func loadSessionData () {
        
        if !Constant.IS_AUTO_SAVE{
            return
        }
               
        guard let history_length = UserDefaultsManager.getObject(type: Length.self, key: Constant.SESSION_MANAGER_STORE_LENGTH_DATA) else {
            return
        }
        
        self.length     = history_length
        self.meterValue        = history_length.meter
        self.kilometerValue    = history_length.kilometer
        self.mileValue         = history_length.mile
        self.centimetersValue  = history_length.centimeters
        self.millimeterValue   = history_length.millimeter
        self.yardValue         = history_length.yard
        self.inchValue         = history_length.inch

        
        UserDefaultsManager.removeObject(key: Constant.SESSION_MANAGER_STORE_LENGTH_DATA)

    }
    
    override func saveBackgroundData() {
        
        if ((self.length.centimeters == 0 && self.length.kilometer == 0))  || !Constant.IS_AUTO_SAVE{
            return
        }
        
        
        UserDefaultsManager.saveObject(data: self.length, key: Constant.SESSION_MANAGER_STORE_LENGTH_DATA)
    }
    
    func updateCalculation() {
        
        guard let textField = self.selectedTextField else { return }
        
        let value = (textField.text! as NSString).doubleValue
        
        switch textField.tag {
        
        case 1:
            
            length.convertMeter(meter: value)
            self.kilometerValue  = length.kilometer
            self.mileValue  = length.mile
            self.centimetersValue  = length.centimeters
            self.millimeterValue   = length.millimeter
            self.yardValue = length.yard
            self.inchValue = length.inch
            
            break
            
        case 2:
            
            length.convertKm(km: value)
            self.meterValue  = length.meter
            self.mileValue   = length.mile
            self.centimetersValue  = length.centimeters
            self.millimeterValue   = length.millimeter
            self.yardValue  = length.yard
            self.inchValue  = length.inch
            
            break
            
        case 3:
            
            length.convertMile(mile: value)
            self.meterValue       = length.meter
            self.kilometerValue   = length.kilometer
            self.millimeterValue  = length.millimeter
            self.centimetersValue = length.centimeters
            self.yardValue        = length.yard
            self.inchValue        = length.inch
            
            
            break
            
        case 4: 
            
            length.convertCm(meter: value)
            self.meterValue       = length.meter
            self.kilometerValue   = length.kilometer
            self.mileValue        = length.mile
            self.millimeterValue  = length.millimeter
            self.yardValue        = length.yard
            self.inchValue        = length.inch
            
            break
            
        case 5:
            
            length.convertMm(meter: value)
            self.kilometerValue  = length.kilometer
            self.mileValue  = length.mile
            self.centimetersValue  = length.centimeters
            self.meterValue   = length.meter
            self.yardValue = length.yard
            self.inchValue = length.inch
            
            break
            
        case 6:
            
            length.convertYard(yard: value)
            self.meterValue  = length.meter
            self.kilometerValue   = length.kilometer
            self.mileValue   = length.mile
            self.centimetersValue  = length.centimeters
            self.millimeterValue   = length.millimeter
            self.inchValue  = length.inch
            
            break
            
        case 7:
            
            length.convertInch(meter: value)
            self.meterValue  = length.meter
            self.kilometerValue   = length.kilometer
            self.mileValue   = length.mile
            self.centimetersValue  = length.centimeters
            self.millimeterValue   = length.millimeter
            self.yardValue  = length.yard
            
            break
            
        default:
            break
            
        }
    }
    
    
    /// keyboard key press event
    override func keyPress() {
        updateCalculation()
    }
    
    override func textFieldTap() {
        
        if !isKeyBoardShow {
            isKeyBoardShow.toggle()
        }
    }
    
    override func doneKeyPress() {
        isKeyBoardShow.toggle()
    }
}
