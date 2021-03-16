//
//  VolumeVC.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-03-13.
//

import UIKit

class VolumeVC: BaseViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var txtCm: CustomTextField!
    @IBOutlet weak var txtM: CustomTextField!
    @IBOutlet weak var txtCd: CustomTextField!
    @IBOutlet weak var viwKeyboard: UnitifyKeyboardView!
    @IBOutlet weak var constraintKeyBoardBottom: NSLayoutConstraint!
    
    
    //MARK: - Variables
    
    var volume: Volume = Volume()
    
    var cubicCentimeterValue: Double = 0.0 {
        didSet {
            txtCm.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", cubicCentimeterValue)
        }
    }
    
    var cubicMeterValue: Double = 0.0 {
        didSet {
            txtM.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", cubicMeterValue)
        }
    }
    
    var cubicDecimeterValue: Double = 0.0 {
        didSet {
            txtCd.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", cubicDecimeterValue)
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
        
        if (self.volume.cubicCentimetre == 0 && self.volume.cubicMetre == 0) {
            Alert.showMessage(msg: Constant.HISTORY_DATA_ZERO_CANT_STORE, on: self)
            return
        }
        
        if let history_data = UserDefaultsManager.getObject(type: [Volume].self, key: Constant.HISTORY_MANAGER_STORE_VOLUME_DATA){
            
            if history_data.contains(where: {$0  == self.volume}) {
                
                Alert.showMessage(msg: Constant.HISTORY_DATA_ALREADY_EXISTS, on: self)
                
            } else {
                
                self.saveHistoryData(data: self.volume, type: [Volume].self, key: Constant.HISTORY_MANAGER_STORE_VOLUME_DATA)
            }
        } else {
            self.saveHistoryData(data: self.volume, type: [Volume].self, key: Constant.HISTORY_MANAGER_STORE_VOLUME_DATA)
        }
    }
    
    @IBAction func refreshBtnTap(_ sender: Any) {
        
        UserDefaultsManager.removeObject(key: Constant.SESSION_MANAGER_STORE_VOLUME_DATA)
        
        self.volume = Volume()
        
        self.cubicMeterValue  = 0
        self.cubicCentimeterValue  = 0
        self.cubicDecimeterValue   = 0
       
    }
    
    
    //MARK: - Custom Method
    
    ///setup ui
    private func setupUI() {
        viwKeyboard.delegate = self
        self.backgroundNotification()
        self.loadSessionData()
    }
    
    private func loadSessionData () {
    
        if !Constant.IS_AUTO_SAVE{
            return
        }
        
        guard let history_volume = UserDefaultsManager.getObject(type: Volume.self, key: Constant.SESSION_MANAGER_STORE_VOLUME_DATA) else {
            return
        }
        
        self.volume = history_volume
        self.cubicCentimeterValue = history_volume.cubicCentimetre
        self.cubicMeterValue      = history_volume.cubicMetre
        self.cubicDecimeterValue  = history_volume.cubicDecimetre

        UserDefaultsManager.removeObject(key: Constant.SESSION_MANAGER_STORE_VOLUME_DATA)
    }
    
    override func saveBackgroundData() {
        
        if ((self.volume.cubicCentimetre == 0 && self.volume.cubicMetre == 0))  || !Constant.IS_AUTO_SAVE{
            return
        }
        
        
        UserDefaultsManager.saveObject(data: self.volume, key: Constant.SESSION_MANAGER_STORE_VOLUME_DATA)
    }
    
    func updateCalculation() {
        
        guard let textField = self.selectedTextField else { return }
        
        let value = (textField.text! as NSString).doubleValue
        
        switch textField.tag {
        
        case 1:
            
            volume.convertCubicCentimeter(cm: value)
            self.cubicMeterValue = volume.cubicMetre
            self.cubicDecimeterValue     = volume.cubicDecimetre
            
            break
            
        case 2:
            
            volume.convertCubicMeter(m: value)
            self.cubicCentimeterValue = volume.cubicCentimetre
            self.cubicDecimeterValue  = volume.cubicDecimetre

            break
            
        case 3:
            
            
            volume.convertCubicDecimeter(cd: value)
            self.cubicCentimeterValue = volume.cubicCentimetre
            self.cubicDecimeterValue     = volume.cubicDecimetre

            break
            
            
        default:
            break
            
        }
    }
    
    /// keyboard key press event
    override func keyPress() {
        
        updateCalculation()
        
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
