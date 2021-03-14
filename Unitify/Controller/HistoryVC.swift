//
//  HistoryVC.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-03-14.
//

import UIKit

class HistoryVC: UIViewController {
    
    //MARK: - @IBOutltes
    @IBOutlet weak var tblMethods: UITableView!
    
    //MARK: - Variables
    let methods: [ConvertTypes] = [.weight, .temperature,.volume, .volumeliquid, .length, .speed]
    var selectedCell = -1
    
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
        
        tblMethods.tableFooterView = UIView()
        tblMethods.estimatedRowHeight = UITableView.automaticDimension
        
        DispatchQueue.main.async {
            self.tblMethods.reloadWithAnimation()
        }
    }
}
