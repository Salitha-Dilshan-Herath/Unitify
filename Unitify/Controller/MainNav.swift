//
//  MainNav.swift
//  Unitify
//
//  Created by Spemai-Macbook on 2021-03-12.
//

import UIKit

class MainNav: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let navBarAp = UINavigationBarAppearance()
        navBarAp.configureWithOpaqueBackground()
        navBarAp.titleTextAttributes      = [.foregroundColor: UIColor.white]
        navBarAp.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAp.backgroundColor  = UIColor().getNavigationColor()
        navigationBar.standardAppearance = navBarAp
        navigationBar.scrollEdgeAppearance = navBarAp
        
        
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        if let topVC = viewControllers.last {
            return topVC.preferredStatusBarStyle
        }
        
        return .default
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
