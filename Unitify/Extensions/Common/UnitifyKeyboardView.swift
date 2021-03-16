//
//  UnitifyKeyboardView.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-02-07.
//

import UIKit

protocol UnitifyKeyboardViewDelegate {
    
    func numberKeyPress(number: Int) /// mark: when number button tap this will be fire
    func decimalKeyPress() /// mark: when decimal button tap this will be fire
    func clearKeyPress() /// mark: when clear button tap this will be fire
    func negativeKeyPress() /// mark: when negative button tap this will be fire
    func keyPress() /// mark: when any button tap this will be fire
    func doneKeyPress()  /// mark: when done button this will be fire
}

class UnitifyKeyboardView: UIView {

    //MARK: - @IBOutlets
    @IBOutlet var keys: [UIButton]!
    @IBOutlet var viwContent: UIView!
    @IBOutlet weak var viwOptions: UIView!
    @IBOutlet weak var btnNegative: UIButton!
    
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
        viwContent.layer.cornerRadius = 15
        viwContent.clipsToBounds = true
        
    }
    
    func hideNegativeButton()  {
        btnNegative.removeFromSuperview()
    }
    
    @IBAction func NumberBtnTap(_ sender: UIButton) {
        self.delegate?.numberKeyPress(number: Int(sender.tag))
        self.delegate?.keyPress()
    }
    
    @IBAction func DecimalBtnTap(_ sender: Any) {
        self.delegate?.decimalKeyPress()
        self.delegate?.keyPress()

    }
    
    @IBAction func clearBtnTap(_ sender: Any) {
        self.delegate?.clearKeyPress()
        self.delegate?.keyPress()

    }
    
    @IBAction func negativeBtnTap(_ sender: Any) {
        self.delegate?.negativeKeyPress()
        self.delegate?.keyPress()

    }
    
    @IBAction func doneBtnPress(_ sender: Any) {
        self.delegate?.doneKeyPress()
    }
}
