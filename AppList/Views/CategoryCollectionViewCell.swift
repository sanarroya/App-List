//
//  CategoryCollectionViewCell.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/27/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryName: UILabel!
    
    /**
     General configuration of the Cell
     
     - parameter category: Name of the category
     */
    func configureCellWithCategory(category: String) {
        self.categoryName.text = category
        
        switch UIDevice.currentDevice().userInterfaceIdiom {
        case .Pad:
            self.categoryName.font = self.categoryName.font.fontWithSize(30.0)
            self.categoryName.textAlignment = .Center
            break
        default:
            break
        }
        configureCellLayer()
        
    }
    
    /**
     Configures the cells layer
     */
    private func configureCellLayer() {
        
        layer.cornerRadius = 8.0
        layer.borderWidth = 2.0
        clipsToBounds = false
        layer.masksToBounds = false
        
    }
}
