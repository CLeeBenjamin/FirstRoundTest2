//
//  TabbarDesignable.swift
//  FirstRoundTest
//
//  Created by Caston  Boyd on 7/11/18.
//  Copyright © 2018 Caston  Boyd. All rights reserved.
//

import UIKit

@IBDesignable class TabbarDesignable: UITabBar{

  
    @IBInspectable var normalTint: UIColor = UIColor.clear {
        didSet {
            UITabBar.appearance().tintColor = normalTint
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: normalTint], for: UIControlState())
        }
    }
    
    @IBInspectable var selectedTint: UIColor = UIColor.clear {
        didSet {
            UITabBar.appearance().tintColor = selectedTint
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: selectedTint], for:UIControlState.selected)
        }
    }
    
    @IBInspectable var fontName: String = "" {
        didSet {
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: normalTint, NSAttributedStringKey.font: UIFont(name: fontName, size: 11)!], for: UIControlState())
            
          
        }
    }
}
