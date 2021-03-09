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


extension UIViewController {
    
    func setupNavigationBar()  {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.barTintColor = UIColor().getNavigationColor()
        self.navigationController?.navigationBar.tintColor = UIColor.white

        let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        
        let statusBar = UIView(frame: keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
           statusBar.backgroundColor = #colorLiteral(red: 0.8589604497, green: 0.3303647041, blue: 0.3605391979, alpha: 1)
        
        keyWindow?.addSubview(statusBar)
        
        navigationController?.view.backgroundColor = UIColor.white
    }
}


extension UIColor {
    

    func getNavigationColor() -> UIColor {
            return #colorLiteral(red: 0.8589604497, green: 0.3303647041, blue: 0.3605391979, alpha: 1)
        }

}
