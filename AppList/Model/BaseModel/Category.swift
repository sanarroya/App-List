//
//  Category.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/26/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class Category: Object {
    
    dynamic var name = ""
    var apps = List<AppInfo>()
    
    /**
     Initializes the object from a list of apps and a name
     
     - parameter name: Name of the category
     - parameter apps: Apps in the category
     
     - returns: Object initialized
     */
    convenience init(name: String, apps: List<AppInfo>) {
        self.init()
        self.name = name
        self.apps = apps
    }
}
