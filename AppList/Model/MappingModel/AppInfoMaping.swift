//
//  AppInfo.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/26/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import UIKit
import ModelRocket

class AppInfoMapping: Model, JSONTransformable {

    let name =          Property<String>(key: "im:name.label")
    let image =         PropertyArray<AppImagesMapping>(key: "im:image")
    let summary =       Property<String>(key: "summary.label")
    let price =         Property<AppPriceMapping>(key: "im:price.attributes")
    let artist =        Property<AppArtistMapping>(key: "im:artist")
    let category =      Property<String>(key: "category.attributes.term")
    let releaseDate =   Property<String>(key: "im:releaseDate.attributes.label")
    let link =          Property<String>(key: "link.attributes.href")
    
    class func fromJSON(json: JSON) -> AppInfoMapping {
        return AppInfoMapping(json: json)
    }
    
    func toJSON() -> AnyObject {
        return self.json().dictionary
    }
    
}
