//
//  InternetConnection.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/29/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import Foundation
import ReachabilitySwift


class InternetConnection {
    
    class func checkInternetConnection(completionHandler: (isConnected: Bool) -> ()) {
        let reachability: Reachability
        let hostName = "google.com"
        do {
            reachability = try Reachability(hostname: hostName)
            
        } catch ReachabilityError.FailedToCreateWithAddress(let address) {
            print("Unable to create\nReachability with address:\n\(address)")
            return
        }catch{
            print("Unable to create Reachability")
            return
        }
        
        reachability.whenReachable = { reachability in
            // this is called on a background thread, but UI updates must
            // be on the main thread, like this:
            
            dispatch_async(dispatch_get_main_queue()) {
                completionHandler(isConnected: true)
                if reachability.isReachableViaWiFi() {
                    print("Reachable via WiFi")
                } else {
                    print("Reachable via Cellular")
                }
            }
        }
        reachability.whenUnreachable = { reachability in
            // this is called on a background thread, but UI updates must
            // be on the main thread, like this:
            
            dispatch_async(dispatch_get_main_queue()) {
                completionHandler(isConnected: false)
                print("Not reachable")
            }
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
        
        reachability.stopNotifier()
    }
}
