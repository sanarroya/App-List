//
//  AppListRouter.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/25/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import Foundation
import Alamofire


enum AppListRouter: URLRequestConvertible {
    
    static let kBaseURL = "https://itunes.apple.com/us/rss"

    case GetTopTwenty
    
    var method: Alamofire.Method {
        
        switch self {
        case .GetTopTwenty:
            return .GET
        }
    }
    
    var path: String {
        
        switch self {
        case .GetTopTwenty:
            return "/topfreeapplications/limit=20/json"
        }
    }
    
    var URLRequest: NSMutableURLRequest {
        let url = NSURL(string: AppListRouter.kBaseURL)
        let mutableURLRequest = NSMutableURLRequest(URL: (url?.URLByAppendingPathComponent(path))!)
        mutableURLRequest.HTTPMethod = method.rawValue
        mutableURLRequest.timeoutInterval = 10.0
        
        switch self {
        case .GetTopTwenty:
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: nil).0
        }
    }
}