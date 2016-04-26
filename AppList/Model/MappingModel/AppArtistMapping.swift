//
//  AppArtist.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/26/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import UIKit
import ModelRocket

class AppArtistMapping: Model, JSONTransformable {

    let name =      Property<String>(key: "label")
    let portfolio = Property<String>(key: "attributes.href")
    
    class func fromJSON(json: JSON) -> AppArtistMapping {
        return AppArtistMapping(json: json)
    }
    
    func toJSON() -> AnyObject {
        return self.json().dictionary
    }
}
