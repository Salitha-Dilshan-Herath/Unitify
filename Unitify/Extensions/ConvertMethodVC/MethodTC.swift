//
//  MethodTC.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-02-06.
//

import UIKit

class MethodTC: UITableViewCell {

    @IBOutlet weak var imgMethod: UIImageView!
    @IBOutlet weak var lblMethodName: UILabel!
    @IBOutlet weak var viwBackground: UIView!
    @IBOutlet weak var viwImgBack: UIView!
    
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

}
