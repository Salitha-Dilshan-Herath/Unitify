//
//  UnitifyKeyboardView.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-02-07.
//

import UIKit

protocol UnitifyKeyboardViewDelegate {
    
    func numberKeyPress(number: Int)
    func decimalKeyPress()
    func clearKeyPress()
    func negativeKeyPress()

}

class UnitifyKeyboardView: UIView {

    
    //MARK: - @IBOutlets
    @IBOutlet var viwContent: UIView!
 
    //MARK:- Variables
    var delegate: UnitifyKeyboardViewDelegate?
    
    //MARK: - Life Cycle Methods
    
    ///for using custom view in code
    override init(frame: CGRect) {
        super.init(frame: frame)
        baseInit()
    }
    
    ///for using custom view in @IBOultes
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        baseInit()
    }
    
    ///base initialisation
    private func baseInit () {
        Bundle.main.loadNibNamed(Constant.KEYBOARD_NIB_NAME, owner: self, options: nil)
        addSubview(viwContent)
        viwContent.frame = self.bounds
        viwContent.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    @IBAction func NumberBtnTap(_ sender: UIButton) {
        self.delegate?.numberKeyPress(number: Int(sender.tag))
    }
    
    @IBAction func DecimalBtnTap(_ sender: Any) {
        self.delegate?.decimalKeyPress()
    }
    
    @IBAction func clearBtnTap(_ sender: Any) {
        self.delegate?.clearKeyPress()
    }
    
    @IBAction func negativeBtnTap(_ sender: Any) {
        self.delegate?.negativeKeyPress()

    }
    
}
