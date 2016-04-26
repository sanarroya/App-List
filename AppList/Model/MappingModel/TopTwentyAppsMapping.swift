//
//  TopTwentyAppsMapping.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/26/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import UIKit
import ModelRocket

class TopTwentyAppsMapping: Model {
    
    let apps = PropertyArray<AppInfoMapping>(key: "feed.entry")
}
