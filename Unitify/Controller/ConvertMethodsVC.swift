//
//  ConvertMethodsVC.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-02-06.
//

import UIKit

class ConvertMethodsVC: UIViewController {
    
    //MARK: - @IBOutltes
    @IBOutlet weak var tblMethods: UITableView!
    
    //MARK: - Variables
    let methods: [String] = ["Weight", "Temperature","Area", "Volume", "Length", "Speed", ]
    
    
    //MARK: - Life Cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK Custom Methods
    private func setupUI() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tblMethods.tableFooterView = UIView()
    }
    
    
}
