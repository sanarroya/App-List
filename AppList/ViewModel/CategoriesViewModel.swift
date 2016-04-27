//
//  CategoriesViewModel.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/26/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class CategoriesViewModel {
    
    let categoriesDictionary: [String: Results<AppInfo>]!
    let categories: [String]!
    
    init() {
        categoriesDictionary = RealmLogic.sharedInstance.categoriesDictionary()
        categories = Array(categoriesDictionary.keys.sort())
    }
}