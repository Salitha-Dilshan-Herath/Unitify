//
//  CustomTextField.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-02-08.
//

import UIKit


@IBDesignable

class CustomTextField: UITextField {

    @IBInspectable var isKeyBoardShow: Bool = false {
        
        didSet{
            update()
        }
    }
    
    func update()  {
        
        if !isKeyBoardShow {
            inputView = UIView()
            inputAccessoryView = UIView()
        }
        
    }

}
