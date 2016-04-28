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
    
    class func cellSelected(cell: UICollectionViewCell) {
        
        let currentFrame = cell.frame
        let currentLayer = cell.layer.shadowPath
        var newLayer = cell.layer.shadowPath
        var newFrame = cell.frame
        
        newFrame.size.width = cell.frame.size.width - 20.0
        newFrame.size.height = cell.frame.size.height - 10.0
        newFrame.origin.x = cell.frame.origin.x + 10.0
        newFrame.origin.y = cell.frame.origin.y + 10.0
        newLayer = UIBezierPath(roundedRect: CGRectMake(0.0, cell.bounds.height, cell.bounds.width, 10.0), cornerRadius: 8.0).CGPath
        
        UIView.animateWithDuration(0.2, animations: {
            
            cell.frame = newFrame
            cell.layer.shadowPath = newLayer
            
        }, completion: { finished in
            
            UIView.animateWithDuration(0.2, animations: {
                cell.frame = currentFrame
                cell.layer.shadowPath = currentLayer
            })
        })
        
    }
}