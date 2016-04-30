//
//  AppCollectionViewCell.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/29/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import UIKit
import Kingfisher

class AppCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var logo: UIImageView!
    
    /**
     General configuration of the Cell
     
     - parameter app: AppInfo object with the information to configure the cell
     */
    func configureCellWithApp(app: AppInfo) {
        
        self.appName.text = app.name
        switch UIDevice.currentDevice().userInterfaceIdiom {
        case .Phone:
            self.logo.kf_setImageWithURL(NSURL(string: app.smallImage)!, placeholderImage: nil, optionsInfo: nil)
        default:
            self.logo.kf_setImageWithURL(NSURL(string: app.largeImage)!, placeholderImage: nil, optionsInfo: nil)
        }
        
        self.logo.layer.cornerRadius = 8.0  
        self.logo.clipsToBounds = true
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
