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
            self.meterValue  = length.meter
            self.kilometerValue  = length.kilometer
            self.millimeterValue  = length.millimeter
            self.centimetersValue  = length.centimeters
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

}
