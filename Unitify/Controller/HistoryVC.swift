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
    @IBOutlet weak var viwPopup: UIView!
    @IBOutlet weak var viwPopupBack: UIView!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var lblHistoryData: UILabel!
    
    //MARK: - Variables
    let methods: [ConvertTypes] = [.weight, .temperature,.volume, .volumeliquid, .length, .speed]
    var selectedCell = -1
    
    //MARK: - Life Cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
        setupUI()
        
    }
    
    //MARK: - Status bar color change
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    //MARK: Custom Methods
    private func setupUI() {
        
        self.setupNavigationBar()
        
        self.viwPopup.isHidden = true
        self.selectedCell      = -1
        
        self.tblMethods.tableFooterView = UIView()
        self.tblMethods.estimatedRowHeight = UITableView.automaticDimension
        
        DispatchQueue.main.async {
            self.tblMethods.reloadWithAnimation()
        }
        
        self.viwPopupBack.layer.cornerRadius = 10
        self.btnClose.layer.cornerRadius = 8
        self.btnClose.layer.borderWidth  = 1
        self.btnClose.layer.borderColor  = UIColor().getNavigationColor().cgColor
    }
    
    @IBAction func closeBtnTap(_ sender: Any) {
        self.viwPopup.isHidden = true
    }
    
}

extension HistoryVC: HistoryMethodTCDelegate {
    
    func itemTap(data: Any) {
        
        let type = methods[self.selectedCell]
        
        switch type {
        
        case .weight:
            
            let weight = data as! Weight
            
            lblHistoryData.text = "\(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", weight.ounce)) oz \n\n \(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", weight.gram)) g \n\n \(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", weight.pound)) lb \n\n \(Int(weight.stone)) st  \(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", weight.stoneP)) pound \n\n \(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", weight.kg)) kg"
            
        case .temperature:
            
            let temp = data as! Temperature
            
            lblHistoryData.text = "\(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", temp.celsius)) ℃ \n\n \(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", temp.fahrenheit)) ℉ \n\n \(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", temp.kelvin)) °K"
            
            break
        case .length:
            
            let len = data as! Length
            
            lblHistoryData.text = "\(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", len.centimeters)) cm  \(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", len.meter)) m \n\n \(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", len.inch)) inch  \(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", len.kilometer)) km \n\n \(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", len.meter)) m  \(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", len.mile)) mile \n\n \(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", len.yard)) yard  \(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", len.millimeter)) mm"
            
            break
        case .speed:
            
            let speed = data as! Speed
            
            lblHistoryData.text = "\(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", speed.kmh)) kmh \n\n \(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", speed.mh)) mh \n\n \(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", speed.ms)) ms \n\n \(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", speed.knot)) knot"
            
            break
        case .volume:
            
            let volume = data as! Volume
            
            lblHistoryData.text = "\(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", volume.cubicMetre)) m³ \n\n \(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", volume.cubicCentimetre)) cm³ \n\n \(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", volume.cubicDecimetre)) dm³"
            
            break
        case .volumeliquid:
            
            let liquid = data as! Liquid
            
            lblHistoryData.text = "\(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", liquid.millilitre)) ml \n\n \(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", liquid.litre)) l \n\n \(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", liquid.gallon)) gal \n\n \(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", liquid.fluid)) fluid \n\n \(String(format:"%.\(Constant.NUMBER_OF_DECIMAL_PLACES)f", liquid.pint)) pint"
            break
        }
        
        self.viwPopup.isHidden = false
    }
    
    
}
