//
//  TextFieldBoardViw.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-03-16.
//

import UIKit

class TextFieldBoardViw: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initiate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initiate()
    }
    
    func initiate()  {
        
        self.layer.cornerRadius = 6
        self.layer.borderWidth  = 0.2
        self.layer.backgroundColor = UIColor.systemGray6.cgColor
    }
}
