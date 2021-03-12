//
//  CustomTextField.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-02-08.
//

import UIKit


class CustomTextField: UITextField {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        update()
    }
    
    func update()  {
        inputView = UIView()
        inputAccessoryView = UIView()
        
    }
    
}

