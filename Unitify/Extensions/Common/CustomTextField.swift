//
//  CustomTextField.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-02-08.
//

import UIKit


@IBDesignable

class CustomTextField: UITextField {
    
    @IBInspectable var postfix : String = ""
    @IBInspectable var removePostfixOnEditing : Bool = true
    
    @IBInspectable var isKeyBoardShow: Bool = false {
        
        didSet{
            update()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func update()  {
        
        if !isKeyBoardShow {
            inputView = UIView()
            inputAccessoryView = UIView()
        }
        
    }
    
}

