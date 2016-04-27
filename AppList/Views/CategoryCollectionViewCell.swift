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
    
    func configureCellWithCategory(category: String) {
        self.categoryName.text = category
        configureCellLayer()
        
    }
    
    
    private func configureCellLayer() {
        
        layer.cornerRadius = 8.0
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.grayColor().CGColor
//        layer.shadowColor = layer.borderColor
//        layer.shadowOffset = CGSizeMake(4.00, 0)
//        layer.shadowOpacity = 1.0
//        layer.shadowRadius = 4.0
//        layer.shadowPath = UIBezierPath(roundedRect: CGRectMake(0.0, bounds.height, bounds.width, 10.0), cornerRadius: 8.0).CGPath
        clipsToBounds = false
        layer.masksToBounds = false
        
    }
}
