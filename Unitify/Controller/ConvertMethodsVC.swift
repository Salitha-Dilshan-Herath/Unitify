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
    let methods: [ConvertTypes] = [.weight, .temperature,.volume, .volumeliquid, .length, .speed]
    var selectedConvertType = ConvertTypes.weight
    
    //MARK: - Life Cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    //MARK Custom Methods
    private func setupUI() {

        self.setupNavigationBar()
        
        tblMethods.tableFooterView = UIView()
        tblMethods.estimatedRowHeight = UITableView.automaticDimension

        DispatchQueue.main.async {
            self.tblMethods.reloadWithAnimation()
        }
    }
}

enum ConvertTypes: String {
    case weight = "Weight"
    case temperature = "Temperature"
    case length = "Length"
    case speed  = "Speed"
    case volume = "Volume"
    case volumeliquid = "Volume Liquid"
}
