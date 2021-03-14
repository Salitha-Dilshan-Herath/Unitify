//
//  HistoryVC.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-03-14.
//

import UIKit

class HistoryVC: UIViewController {
    
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
        
        
    }
}
