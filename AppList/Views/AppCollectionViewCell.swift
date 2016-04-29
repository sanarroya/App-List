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
    
    func configureCellWithApp(app: AppInfo) {
        
        self.appName.text = app.name
        self.logo.kf_setImageWithURL(NSURL(string: app.smallImage)!, placeholderImage: nil, optionsInfo: nil)
        self.logo.layer.cornerRadius = 8.0  
        configureCellLayer()
        
    }
    
    
    private func configureCellLayer() {
        
        layer.cornerRadius = 8.0
        layer.borderWidth = 2.0
        clipsToBounds = false
        layer.masksToBounds = false
        
    }

}
