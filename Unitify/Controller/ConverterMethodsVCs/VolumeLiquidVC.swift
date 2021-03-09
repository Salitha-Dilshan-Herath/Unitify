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
    
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: - Custom Method
    
    ///setup ui
    private func setupUI() {
            viwKeyboard.delegate = self
        //        setupTextFields()
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
    
}

