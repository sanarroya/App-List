//
//  RealmLogic.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/26/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class RealmLogic {
    
    static let sharedInstance = RealmLogic()
    private var categories: Results<Category>
    
    private init() {
        self.categories = RealmOperations.getCategories()
    }
    
    
    /**
     Generates a dictionary with categories and their respective apps [category: apps]
     
     - returns: Dictionary with categories and apps of each category
     */
    func categoriesDictionary() -> [String: Results<AppInfo>] {
        
        var dictionary = [String: Results<AppInfo>]()
        
        for category in self.categories {
            dictionary[category.name] = category.apps.sorted("name")
        }
        
        return dictionary
    }
}