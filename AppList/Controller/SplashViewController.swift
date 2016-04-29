//
//  SplashViewController.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/29/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import UIKit
import RxSwift

class SplashViewController: UIViewController {
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        APIManager.getTopTwenty()
            .subscribe(onNext:{ topApps in
                print("onNExt")
                RealmOperations.writeToRealm(topApps)
                let categoriesViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CategoriesNavigationBar")
                self.presentViewController(categoriesViewController, animated: true, completion: nil)
                }, onError: { (ErrorType) in
                    
            }).addDisposableTo(disposeBag)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
