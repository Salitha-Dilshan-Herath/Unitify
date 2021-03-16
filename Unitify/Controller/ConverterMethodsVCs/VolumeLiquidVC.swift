//
//  VolumeLiquidVC.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-03-01.
//

import UIKit

class VolumeLiquidVC: BaseViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var viwKeyboard: UnitifyKeyboardView!
    @IBOutlet weak var txtGallon: CustomTextField!
    @IBOutlet weak var txtLiter: CustomTextField!
    @IBOutlet weak var txtPint: CustomTextField!
    @IBOutlet weak var txtFOunce: CustomTextField!
    @IBOutlet weak var txtMillilitre: CustomTextField!
    @IBOutlet weak var viwScrolle: UIScrollView!
    @IBOutlet weak var constraintTxtFieldViw: NSLayoutConstraint!
    @IBOutlet weak var constraintKeyBoardBottom: NSLayoutConstraint!
    
    //MARK: - Variables
    var liquid: Liquid = Liquid()
    
    var gallonValue: Double = 0.0 {
        didSet {
            txtGallon.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", gallonValue)
        }
    }
    
    var litreValue: Double = 0.0 {
        didSet {
            txtLiter.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", litreValue)
        }
    }
    
    var pintValue: Double = 0.0 {
        didSet {
            txtPint.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", pintValue)
        }
    }
    
    var fluidValue: Double = 0.0 {
        didSet {
            txtFOunce.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", fluidValue)
        }
    }
    
    var millilitreValue: Double = 0.0 {
        didSet {
            txtMillilitre.text = String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", millilitreValue)
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
        
        if self.liquid.gallon == 0 {
            Alert.showMessage(msg: Constant.HISTORY_DATA_ZERO_CANT_STORE, on: self)
            return
        }
                
        if let history_data = UserDefaultsManager.getObject(type: [Liquid].self, key: Constant.HISTORY_MANAGER_STORE_LIQUID_DATA){
         
            if history_data.contains(where: {$0  == self.liquid}) {
                
                Alert.showMessage(msg: Constant.HISTORY_DATA_ALREADY_EXISTS, on: self)
                
            } else {
                
                self.saveHistoryData(data: self.liquid, type: [Liquid].self, key: Constant.HISTORY_MANAGER_STORE_LIQUID_DATA)
            }
        } else {
            self.saveHistoryData(data: self.liquid, type: [Liquid].self, key: Constant.HISTORY_MANAGER_STORE_LIQUID_DATA)
        }
    }
    
    @IBAction func refreshBtnTap(_ sender: Any) {
           
       UserDefaultsManager.removeObject(key: Constant.SESSION_MANAGER_STORE_LIQUID_DATA)
       
       self.liquid = Liquid()
       
       self.gallonValue     = 0
       self.litreValue      = 0
       self.pintValue       = 0
       self.fluidValue      = 0
       self.millilitreValue = 0
        
    }
    
    //MARK: - Custom Method
    
    ///setup ui
    private func setupUI() {
        viwKeyboard.delegate = self
        isKeyBoardShow = false
        self.backgroundNotification()
        self.loadSessionData()
    }
    
    private func loadSessionData () {
        
        if !Constant.IS_AUTO_SAVE{
            return
        }
        
        guard let history_liquid = UserDefaultsManager.getObject(type: Liquid.self, key: Constant.SESSION_MANAGER_STORE_LIQUID_DATA) else {
            return
        }
        
        self.liquid = history_liquid
        self.gallonValue     = history_liquid.gallon
        self.litreValue      = history_liquid.litre
        self.pintValue       = history_liquid.pint
        self.fluidValue      = history_liquid.fluid
        self.millilitreValue = history_liquid.millilitre
        
        UserDefaultsManager.removeObject(key: Constant.SESSION_MANAGER_STORE_LIQUID_DATA)

    }
    
    override func saveBackgroundData() {
        
        if (self.liquid.gallon == 0 && self.liquid.litre == 0)  || !Constant.IS_AUTO_SAVE{
            return
        }
        
        UserDefaultsManager.saveObject(data: self.liquid, key: Constant.SESSION_MANAGER_STORE_LIQUID_DATA)
    }
    
    func updateCalculation() {
        
        guard let textField = self.selectedTextField else { return }
        
        let value = (textField.text! as NSString).doubleValue
        
        switch textField.tag {
        
        case 1:
            
            liquid.convertGallon(gallon: value)
            self.litreValue = liquid.litre
            self.pintValue  = liquid.pint
            self.fluidValue = liquid.fluid
            self.millilitreValue = liquid.millilitre
            
            break
            
        case 2:
            
            liquid.convertLitre(litre: value)
            self.gallonValue = liquid.gallon
            self.pintValue  = liquid.pint
            self.fluidValue = liquid.fluid
            self.millilitreValue = liquid.millilitre
            
            break
            
        case 3:
            
            
            liquid.convertPint(pint: value)
            self.litreValue = liquid.litre
            self.gallonValue  = liquid.gallon
            self.fluidValue = liquid.fluid
            self.millilitreValue = liquid.millilitre
            
            break
            
        case 4:
            
            
            liquid.convertFluid(pint: value)
            self.litreValue = liquid.litre
            self.pintValue  = liquid.pint
            self.gallonValue = liquid.gallon
            self.millilitreValue = liquid.millilitre
            
            break
            
        case 5:
            
            liquid.convertMillilitre(ml: value)
            self.litreValue = liquid.litre
            self.pintValue  = liquid.pint
            self.fluidValue = liquid.fluid
            self.gallonValue = liquid.gallon
            
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

