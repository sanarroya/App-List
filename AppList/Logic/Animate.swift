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
    
    /**
     Animates the aparition of a cell
     
     - parameter cell: Cell to animate
     */
    class func cellAparation(cell: UICollectionViewCell) {
        
        let finalCellFrame = cell.frame;
        cell.frame = CGRectMake(Animate().cellInitialCoordinate(cell.frame.origin.x), cell.frame.origin.y, cell.frame.width, cell.frame.height)
        UIView.animateWithDuration(0.5, delay: 0.4, options: [.CurveEaseOut, .LayoutSubviews], animations: {
            cell.frame = finalCellFrame
        }, completion: nil)
    }
    
    /**
     Animates the cell when is cellected
     
     - parameter cell:              Cell to animate
     - parameter animationFinished: Completion handler indicated the event is over
     */
    class func cellSelected(cell: UICollectionViewCell, animationFinished:() -> ()) {
        
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
                
                }, completion: { finished in
                    animationFinished()
            })
        })
    }
    
    /**
     Gets the initial x coordinate to animate the aparition of a cell
     
     - parameter x: Final x coordinate
     
     - returns: Initial x coordinate
     */
    private func cellInitialCoordinate(x: CGFloat) -> CGFloat {
        
        let screenWidth = UIScreen.mainScreen().bounds.width
        
        switch UIDevice.currentDevice().userInterfaceIdiom {
        case .Phone:
            
            return -1000.0
            
        default:
            if(x < screenWidth / 2) {
                return -1000.0
            }else {
                return screenWidth + 1000.0
            }

        }
    }
}