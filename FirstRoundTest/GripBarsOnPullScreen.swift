//
//  GripBarsOnPullScreen.swift
//  FirstRoundTest
//
//  Created by Caston  Boyd on 7/7/18.
//  Copyright © 2018 Caston  Boyd. All rights reserved.
//

import UIKit

@IBDesignable class GripBarsOnPullScreen: UIView {

    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = newValue > 0
        }
    }
    
    

}
