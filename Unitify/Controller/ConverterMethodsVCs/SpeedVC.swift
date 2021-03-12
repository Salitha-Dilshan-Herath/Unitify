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
    
    //MARK: - Custom Method
    
    ///setup ui
    private func setupUI() {
        viwKeyboard.delegate = self
        isKeyBoardShow = false
        
        //        setupTextFields()
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
