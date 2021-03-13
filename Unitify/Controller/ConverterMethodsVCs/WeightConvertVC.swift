//
//  WeightConvertVC.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-02-07.
//

import UIKit

class WeightConvertVC: BaseViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var viwKeyboard: UnitifyKeyboardView!
    @IBOutlet weak var txtOunce: CustomTextField!
    @IBOutlet weak var txtPound: CustomTextField!
    @IBOutlet weak var txtGram: CustomTextField!
    @IBOutlet weak var txtStone: CustomTextField!
    @IBOutlet weak var txtSpound: CustomTextField!
    @IBOutlet weak var txtKg: CustomTextField!
    @IBOutlet weak var viwScrolle: UIScrollView!
    @IBOutlet weak var constraintTxtFieldViw: NSLayoutConstraint!
    @IBOutlet weak var constraintKeyBoardBottom: NSLayoutConstraint!
    
    //MARK: - Variables
    var weight: Weight = Weight()
    
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
            
            txtStone.text = "\(Int(stoneValue))"
        }
    }
    
    var stonePValue: Double = 0.0 {
        didSet {
            
            txtSpound.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", stonePValue)
        }
    }
    
    var kgValue: Double = 0.0 {
        didSet {
            txtKg.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", kgValue)
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
        
        if let history_data = UserDefaultsManager.getObject(type: [Weight].self, key: Constant.HISTORY_MANAGER_STORE_WEIGHT_DATA){
         
            if history_data.contains(where: {$0  == self.weight}) {
                
                Alert.showMessage(msg: Constant.HISTORY_DATA_ALREADY_EXISTS, on: self)
                
            } else {
                
                self.saveHistoryData(data: self.weight, type: [Weight].self, key: Constant.HISTORY_MANAGER_STORE_WEIGHT_DATA)
            }
        } else {
            self.saveHistoryData(data: self.weight, type: [Weight].self, key: Constant.HISTORY_MANAGER_STORE_WEIGHT_DATA)
        }
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
        
        guard let history_weight = UserDefaultsManager.getObject(type: Weight.self, key: Constant.SESSION_MANAGER_STORE_WEIGHT_DATA) else {
            return
        }
        
        self.weight = history_weight
        self.ounceValue  = history_weight.ounce
        self.poundValue  = history_weight.pound
        self.gramValue   = history_weight.gram
        self.stoneValue  = history_weight.stone
        self.stonePValue = history_weight.stoneP
        self.kgValue     = history_weight.kg
        
        UserDefaultsManager.removeObject(key: Constant.SESSION_MANAGER_STORE_WEIGHT_DATA)

    }
    
    override func saveBackgroundData() {
        UserDefaultsManager.saveObject(data: self.weight, key: Constant.SESSION_MANAGER_STORE_WEIGHT_DATA)
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
