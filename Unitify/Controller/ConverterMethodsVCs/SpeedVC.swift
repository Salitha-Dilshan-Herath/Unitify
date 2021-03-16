//
//  SpeedVC.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-03-06.
//

import UIKit

class SpeedVC: BaseViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var viwKeyboard: UnitifyKeyboardView!
    @IBOutlet weak var txtMs: CustomTextField!
    @IBOutlet weak var txtKmh: CustomTextField!
    @IBOutlet weak var txtMh: CustomTextField!
    @IBOutlet weak var txtKnot: CustomTextField!
    @IBOutlet weak var constraintKeyBoardBottom: NSLayoutConstraint!
    
    //MARK: - Variables
    var speed: Speed = Speed()
    
    var msValue: Double = 0.0 {
        didSet {
            txtMs.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", msValue)
        }
    }
    
    var kmhValue: Double = 0.0 {
        didSet {
            txtKmh.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", kmhValue)
        }
    }
    
    var mhValue: Double = 0.0 {
        didSet {
            txtMh.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", mhValue)
        }
    }
    
    var knotValue: Double = 0.0 {
        didSet {
            txtKnot.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", knotValue)
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
        
        if self.speed.ms == 0 {
            Alert.showMessage(msg: Constant.HISTORY_DATA_ZERO_CANT_STORE, on: self)
            return
        }
                
        if let history_data = UserDefaultsManager.getObject(type: [Speed].self, key: Constant.HISTORY_MANAGER_STORE_SPEED_DATA){
         
            if history_data.contains(where: {$0  == self.speed}) {
                
                Alert.showMessage(msg: Constant.HISTORY_DATA_ALREADY_EXISTS, on: self)
                
            } else {
                
                self.saveHistoryData(data: self.speed, type: [Speed].self, key: Constant.HISTORY_MANAGER_STORE_SPEED_DATA)
            }
        } else {
            self.saveHistoryData(data: self.speed, type: [Speed].self, key: Constant.HISTORY_MANAGER_STORE_SPEED_DATA)
        }
    }
    
    @IBAction func refreshBtnTap(_ sender: Any) {
           
       UserDefaultsManager.removeObject(key: Constant.SESSION_MANAGER_STORE_SPEED_DATA)
       
       self.speed = Speed()
       
       self.msValue  = 0
       self.kmhValue  = 0
       self.mhValue   = 0
       self.knotValue  = 0

    }
    
    //MARK: - Custom Method
    
    ///setup ui
    private func setupUI() {
        self.viwKeyboard.delegate = self
        self.viwKeyboard.hideNegativeButton()

        self.isKeyBoardShow = false
        
        self.backgroundNotification()
        self.loadSessionData()
        
    }
    
    private func loadSessionData () {
        
        if !Constant.IS_AUTO_SAVE{
                    return
        }
        
        guard let history_speed = UserDefaultsManager.getObject(type: Speed.self, key: Constant.SESSION_MANAGER_STORE_SPEED_DATA) else {
            return
        }
        
        self.speed     = history_speed
        self.msValue   = history_speed.ms
        self.kmhValue  = history_speed.kmh
        self.mhValue   = history_speed.mh
        self.knotValue = history_speed.knot
     
        
        UserDefaultsManager.removeObject(key: Constant.SESSION_MANAGER_STORE_SPEED_DATA)

    }
    
    override func saveBackgroundData() {
        
        if (self.speed.ms == 0 && self.speed.kmh == 0)  || !Constant.IS_AUTO_SAVE{
            return
        }
        
        UserDefaultsManager.saveObject(data: self.speed, key: Constant.SESSION_MANAGER_STORE_SPEED_DATA)
    }
    
    func updateCalculation() {
        
        guard let textField = self.selectedTextField else { return }
        
        let value = (textField.text! as NSString).doubleValue
        
        switch textField.tag {
        
        case 1:
            
            speed.convertMs(ms: value)
            self.kmhValue  = speed.kmh
            self.mhValue   = speed.mh
            self.knotValue = speed.knot
            
            break
            
        case 2:
            
            speed.convertKmh(kmh: value)
            self.msValue  = speed.ms
            self.mhValue   = speed.mh
            self.knotValue = speed.knot
            
            break
            
        case 3:
            
            
            speed.convertMh(kmh: value)
            self.kmhValue  = speed.kmh
            self.msValue   = speed.ms
            self.knotValue = speed.knot
            
            break
            
        case 4:
            
            speed.convertKnot(kmh: value)
            self.kmhValue = speed.kmh
            self.mhValue  = speed.mh
            self.msValue  = speed.ms
            
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
