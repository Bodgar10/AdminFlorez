//
//  tabBarVC.swift
//  Florez
//
//  Created by bodgar jair espinosa miranda on 29/11/18.
//  Copyright © 2018 bodgar jair espinosa miranda. All rights reserved.
//

import UIKit

class tabBarVC: UITabBarController {

    var arrayOfImageNameForSelectedState: [String] = []
    var arrayOfImageNameForUnSelectedState: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.arrayOfImageNameForSelectedState.append("icoMenuIncio")
        self.arrayOfImageNameForSelectedState.append("icoMenuFloreria")
        self.arrayOfImageNameForSelectedState.append("icoMenuAdd")
        self.arrayOfImageNameForSelectedState.append("icoMenuConfig")
        self.arrayOfImageNameForSelectedState.append("icoMenuPedidos")
        
        
        self.arrayOfImageNameForUnSelectedState.append("icoMenuIncio")
        self.arrayOfImageNameForUnSelectedState.append("icoMenuFloreria")
        self.arrayOfImageNameForUnSelectedState.append("icoMenuAdd")
        self.arrayOfImageNameForUnSelectedState.append("icoMenuConfig")
        self.arrayOfImageNameForUnSelectedState.append("icoMenuPedidos")
        
        if let count = self.tabBar.items?.count {
            for i in 0...(count-1) {
                let imageNameForSelectedState   = arrayOfImageNameForSelectedState[i]
                let imageNameForUnselectedState = arrayOfImageNameForSelectedState[i]
                
                self.tabBar.items?[i].selectedImage = UIImage(named: imageNameForSelectedState)?.withRenderingMode(.alwaysOriginal)
                self.tabBar.items?[i].image = UIImage(named: imageNameForUnselectedState)?.withRenderingMode(.alwaysOriginal)
            }
        }
        
        let selectedColor   = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let unselectedColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.8117647059, green: 0.4274509804, blue: 0.6117647059, alpha: 1)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
    }

}
