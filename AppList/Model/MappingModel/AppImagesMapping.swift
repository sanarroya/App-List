//
//  AppImagesMapping.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/26/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import UIKit
import ModelRocket

class AppImagesMapping: Model, JSONTransformable {
    
    let link =      Property<String>(key: "label")
    let height =    Property<String>(key: "attributes.height")
    
    class func fromJSON(json: JSON) -> AppImagesMapping {
        return AppImagesMapping(json: json)
    }
    
    func toJSON() -> AnyObject {
        return self.json().dictionary
    }
}
