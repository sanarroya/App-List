//
//  AppsCollectionViewController.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/29/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import UIKit

protocol AppSelectionDelegate: class {
    func appSelected(app: AppInfo)
}


class AppsCollectionViewController: UICollectionViewController {

    let appsViewModel = AppsViewModel()
    private let reuseIdentifier = "Cell"
    static var delegate : AppSelectionDelegate!
    var detailViewController: DetailViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem(image: UIImage(named: "back"), style: .Plain, target: self, action: #selector(goBack))
        navigationItem.leftBarButtonItem = backButton
        let appSplitViewController = splitViewController as! AppListSplitViewController
        detailViewController = appSplitViewController.childViewControllers.last as! DetailViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appsViewModel.currentApps.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! AppCollectionViewCell
        let app = appsViewModel.currentApps[indexPath.row]
        cell.configureCellWithApp(app)
        Animate.cellAparation(cell)
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let selectedApp = appsViewModel.currentApps[indexPath.row]
//        AppsCollectionViewController.delegate.appSelected(selectedApp)
        print("algo")
        let appSplitViewController = splitViewController as! AppListSplitViewController
        detailViewController?.detailViewModel.appInfo = selectedApp
        appSplitViewController.showDetailViewController(detailViewController!, sender: nil)
    }
    

    func goBack() {
        self.performSegueWithIdentifier("goBack", sender: nil)
    }
}
