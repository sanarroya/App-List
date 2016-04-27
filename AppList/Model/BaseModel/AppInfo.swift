//
//  AppInfo.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/26/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class AppInfo: Object {
    
    dynamic var name: String = ""
    dynamic var smallImage: String = ""
    dynamic var mediumImage: String = ""
    dynamic var largeImage: String = ""
    dynamic var summary: String = ""
    dynamic let price: String = "Free"
    dynamic var artistName: String = ""
    dynamic var artistLink: String = ""
    dynamic var category: String = ""
    dynamic var link: String = ""
    
    convenience init(appInfo: AppInfoMapping) {
        self.init()
        self.name = appInfo.name.value!
        self.smallImage = appInfo.image.values[0].link.value!
        self.mediumImage = appInfo.image.values[1].link.value!
        self.largeImage = appInfo.image.values[2].link.value!
        self.summary = appInfo.summary.value!
        self.artistName = appInfo.artist.value!.name.value!
        self.artistLink = appInfo.artist.value!.portfolio.value!
        self.category = appInfo.category.value!
        self.link = appInfo.link.value!
    }
}
