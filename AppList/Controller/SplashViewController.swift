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
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var tryAgainButton: UIButton!
    
    var disposeBag = DisposeBag()
    var doubleCheckFirstLaunch = false
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        activityIndicator.startAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getApps()
    }
    

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        disposeBag = DisposeBag()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tryAgain(sender: AnyObject) {
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
        getApps()
    }
    
    /**
     Get apps from the API and saves it to Realm
     */
    private func getApps() {
        
        InternetConnection.checkInternetConnection { isConnected in
            if(isConnected) {
                
                APIManager.getTopTwenty()
                    .subscribe(onNext:{ topApps in
                        
                        RealmOperations.writeToRealm(topApps)
                        let categoriesViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CategoriesNavigationBar")
                        self.presentViewController(categoriesViewController, animated: true, completion: nil)
                        self.activityIndicator.stopAnimating()
                        
                        }, onError: { (ErrorType) in
                            
                    }).addDisposableTo(self.disposeBag)

            }else {
                self.activityIndicator.stopAnimating()
                if(Validator.isFirstLaunch() || self.doubleCheckFirstLaunch) {
                    self.doubleCheckFirstLaunch = true
                    self.showElements()
                }else {
                    let categoriesViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CategoriesNavigationBar")
                    self.presentViewController(categoriesViewController, animated: true, completion: nil)
                }
            }
        }
    }
    
    private func showElements() {
        
        alertLabel.text = "This app need internet the first time you run it to work correctly, please check your internet connection and try again"
        activityIndicator.stopAnimating()
        activityIndicator.hidden = true
        tryAgainButton.hidden = false
        alertLabel.hidden = false

    }
}
