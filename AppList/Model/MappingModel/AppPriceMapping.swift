//
//  AppPriceMapping.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/26/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import UIKit
import ModelRocket

class AppPriceMapping: Model, JSONTransformable {

    let amount =    Property<String>(key: "amount")
    let currency =  Property<String>(key: "currency")
    
    class func fromJSON(json: JSON) -> AppPriceMapping {
        return AppPriceMapping(json: json)
    }
    
    func toJSON() -> AnyObject {
        return self.json().dictionary
    }
}
