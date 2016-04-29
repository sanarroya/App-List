//
//  RealmOperations.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/26/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class RealmOperations {
    
    
    /**
     Writes apps to realm classified by category
     
     - parameter apps: Apps to be written
     */
    class func writeToRealm(apps: TopTwentyAppsMapping) {
        
        var categories = [String]()
        
        for app in apps.apps.values {
            
            let category = app.category.value!
            
            if(!categories.contains(category)) {
                categories.append(category)
            }
        }
        
        categories.sortInPlace(<)
        
        let realm = try! Realm()
        try! realm.write {
            
            for category in categories {
                
                let appsInfo = List<AppInfo>()
                
                for app in apps.apps.values {
                    
                    if(app.category.value! == category) {
                        let appExists = realm.objects(AppInfo).filter("name = '\(app.name.value!)'").first
                        if (appExists == nil) {
                            let appInfo = AppInfo(appInfo: app)
                            realm.add(appInfo)
                            appsInfo.append(appInfo)
                        }
                    }
                }
                
                let categoryExists = realm.objects(Category).filter("name = '\(category)'").first
                if(categoryExists == nil) {
                    let realmCategory = Category(name: category, apps: appsInfo)
                    realm.add(realmCategory)
                }
            }
        }
        
    }
    
    /**
     Gets categories drom realm
     
     - returns: Categories
     */
    class func getCategories() -> Results<Category> {
        let realm = try! Realm()
        return realm.objects(Category)
    }
}
