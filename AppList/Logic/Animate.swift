//
//  Animate.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/27/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import Foundation
import UIKit

class Animate {
    
    class func cellOnSelection(cell: UICollectionViewCell) {
        
        let currentFrame = cell.frame
        var newFrame = cell.frame
        newFrame.size.width = cell.frame.size.width - 20.0
        newFrame.origin.x = cell.frame.origin.x + 10.0
        
        UIView.animateWithDuration(0.2, animations: {
            
            cell.frame = newFrame
            
        }, completion: { finished in
            
            UIView.animateWithDuration(0.2, animations: {
                cell.frame = currentFrame
            })
        })
        
    }
}