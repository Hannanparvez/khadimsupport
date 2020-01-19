//
//  ordertabbarvc.swift
//  Khadim
//
//  Created by hannan parvez on 19/01/20.
//  Copyright © 2020 Acxiom Consulting. All rights reserved.
//

import UIKit

class ordertabbarvc: UITabBarController,UITabBarControllerDelegate{

   
    @IBOutlet weak var financialTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // [Maybe you don't have a navigation controller] yNavBar indicates the height of the navigation bar.
        var yNavBar = self.navigationController?.navigationBar.frame.size.height
        // yStatusBar indicates the height of the status bar
        var yStatusBar = UIApplication.shared.statusBarFrame.size.height
        // Set the size and the position in the screen of the tab bar
        financialTabBar.frame = CGRect(x:0, y:yNavBar! + yStatusBar + financialTabBar.frame.size.height,width:  financialTabBar.frame.size.width,height:  financialTabBar.frame.size.height)
        // I've added this line to viewDidLoad
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
