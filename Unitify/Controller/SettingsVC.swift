//
//  SettingsVC.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-03-14.
//

import UIKit

class SettingsVC: UIViewController {

    //MARK: - @IBOutlets
    @IBOutlet weak var viwSteper: UIView!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var txtPrecisionCount: UILabel!
    @IBOutlet weak var switchAutoSave: UISwitch!
    
    //MARK: - Variables
    var precision_count: Int = 2 {
        
        didSet {
            
            if precision_count > 1 && precision_count < 5 {
                
                txtPrecisionCount.text = "\(precision_count)"
                
            } else {
                precision_count = oldValue
            }
            
            Constant.NUMBER_OF_DECIMAL_PLACES = precision_count
            UserDefaultsManager.save(data: precision_count, key: Constant.SETTING_NUMBER_OF_DECIMAL_PLACES)
        }
    }
    
    //MARK: - Life Cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }

    //MARK: - Status bar color change
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    //MARK: Custom Methods
    private func setupUI() {

        self.setupNavigationBar()
        
        self.viwSteper.layer.cornerRadius = 5
        self.viwSteper.layer.borderColor  = UIColor.lightGray.cgColor
        self.viwSteper.layer.borderWidth  = 0.5
    
        self.precision_count     = Constant.NUMBER_OF_DECIMAL_PLACES
        self.switchAutoSave.isOn = Constant.IS_AUTO_SAVE
    }

    //MARK: - @IBActions
    
    @IBAction func countBtnTap(_ sender: UIButton) {
        
        if sender.tag == 1 {
            
            precision_count -= 1
            
        } else if sender.tag == 2 {
            
            precision_count += 1

        }
    }
    
    
    @IBAction func autoSaveSwitchTap(_ sender: UISwitch) {
        
        
        Constant.IS_AUTO_SAVE = sender.isOn
        UserDefaultsManager.save(data: sender.isOn, key: Constant.SETTING_IS_AUTO_SAVE)
       
    }
}
