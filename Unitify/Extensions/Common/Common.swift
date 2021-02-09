//
//  Common.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-02-07.
//

import Foundation
import UIKit


extension UITableView {

    func reloadWithAnimation() {
           self.reloadData()
           let tblHeight = self.bounds.size.height
           let cells = self.visibleCells
           var delayCounter = 0
           for cell in cells {
               cell.transform = CGAffineTransform(translationX: 0, y: tblHeight)
           }
           for cell in cells {
               UIView.animate(withDuration: 1.6, delay: 0.08 * Double(delayCounter),usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                   cell.transform = CGAffineTransform.identity
               }, completion: nil)
               delayCounter += 1
           }
       }
}
