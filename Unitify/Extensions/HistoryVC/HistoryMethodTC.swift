//
//  HistoryMethodTC.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-03-14.
//

import UIKit

class HistoryMethodTC: UITableViewCell {

    @IBOutlet weak var imgMethod: UIImageView!
    @IBOutlet weak var lblMethodName: UILabel!
    @IBOutlet weak var viwBackground: UIView!
    @IBOutlet weak var viwImgBack: UIView!
    @IBOutlet weak var imgArrow: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
    }

    
    func setupCell()  {
        
        self.viwBackground.layer.cornerRadius = 10
        self.viwImgBack.layer.cornerRadius = (self.viwImgBack.frame.height ) / 2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func rotateArrow(isExpand: Bool)  {
        
        
        if !isExpand {
            imgArrow.image = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 10, weight: .bold, scale: .small))
        } else {
            imgArrow.image = UIImage(systemName: "chevron.down", withConfiguration: UIImage.SymbolConfiguration(pointSize: 10, weight: .bold, scale: .small))
        }
        
        imgArrow.contentMode = .scaleAspectFit
     }
}
