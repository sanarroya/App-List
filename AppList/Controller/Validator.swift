//
//  Validator.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/29/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import Foundation

class Validator {
    
    class func isFirstLaunch() -> Bool {
        let isNotFirstLaunch = NSUserDefaults.standardUserDefaults().boolForKey("NotFirstLaunch")
        if (isNotFirstLaunch) {
            return false
        }else {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "NotFirstLaunch")
            return true
        }
    }
}