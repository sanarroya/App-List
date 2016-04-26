//
//  APIManager.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/25/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import Realm
import RealmSwift
import ModelRocket

class APIManager {
    
    /**
     Gets the top20 apps from the app store
     
     - returns: Observable with the app list info
     */
    class func getTopTwenty() -> Observable<TopTwentyAppsMapping> {
        return Observable.create{(observer: AnyObserver<TopTwentyAppsMapping>) -> Disposable in
            Alamofire.request(AppListRouter.GetTopTwenty)
                .responseJSON { response in
                
                    if(response.result.isSuccess) {
                        let statusCode = response.response?.statusCode
                        let json = JSON(response.result.value!)
                        
                        
                        if(statusCode == 200) {
                            let topApps = TopTwentyAppsMapping(json: json)
                            observer.onNext(topApps)
                        }
                    }
            }
            return AnonymousDisposable {}
        }
    }
    
}
