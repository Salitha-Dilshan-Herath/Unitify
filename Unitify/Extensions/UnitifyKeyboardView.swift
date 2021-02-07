//
//  UnitifyKeyboardView.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-02-07.
//

import UIKit

class UnitifyKeyboardView: UIView {

    @IBOutlet var viwContent: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        baseInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        baseInit()
    }
    
    private func baseInit () {
        
        Bundle.main.loadNibNamed("UniitifyKeyboard", owner: self, options: nil)
        addSubview(viwContent)
        viwContent.frame = self.bounds
        viwContent.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
