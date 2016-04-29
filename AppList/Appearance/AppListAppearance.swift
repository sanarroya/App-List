//
//  AppListAppearance.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/29/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import Foundation
import UIKit

class AppListAppearance {
    
    /**
     Adds Border to a View
     
     - parameter view:  View to set the border
     - parameter color: Color of the border
     */
    class func setBorderToView(view: UIView, withColor color: UIColor) {
        view.layer.borderColor = color.CGColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 5.0
        view.clipsToBounds = true
    }
}