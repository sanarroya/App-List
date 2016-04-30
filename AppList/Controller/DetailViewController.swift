//
//  DetailViewController.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/29/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moreAppsButton: UIButton!
    @IBOutlet weak var getAppButton: UIButton!
    @IBOutlet weak var releasedDateLabel: UILabel!
    @IBOutlet weak var appSumaryLabel: UITextView!
    
    let detailViewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAuthorApps(sender: AnyObject) {
        openWebsiteInSafariViewControllerForURL((detailViewModel.appInfo?.artistLink)!)
    }

    @IBAction func getApp(sender: AnyObject) {
        openWebsiteInSafariViewControllerForURL((detailViewModel.appInfo?.link)!)
    }
    
    private func configureView() {
        
        logoImageView.kf_setImageWithURL(NSURL(string: (detailViewModel.appInfo?.largeImage)!)!, placeholderImage: nil, optionsInfo: nil)
        logoImageView.layer.cornerRadius = 8.0
        logoImageView.clipsToBounds = true
        nameLabel.text = detailViewModel.appInfo?.name
        moreAppsButton.setTitle("More apps " + (detailViewModel.appInfo?.artistName)!, forState: .Normal)
        releasedDateLabel.text = "Released date: " + (detailViewModel.appInfo?.releaseDate)!
        appSumaryLabel.text = detailViewModel.appInfo?.summary
        navigationItem.title = "App Summary"
        
    }
    
    /**
     Presents the desired url in a Safari View Controller
     
     - parameter item: URL to be presented
     */
    private func openWebsiteInSafariViewControllerForURL(urlString: String) {
        UIApplication.sharedApplication().openURL(NSURL(string: urlString)!)
    }
}
