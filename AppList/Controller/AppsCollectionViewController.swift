//
//  AppsCollectionViewController.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/29/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import UIKit

class AppsCollectionViewController: UICollectionViewController {

    let appsViewModel = AppsViewModel()
    private let reuseIdentifier = "Cell"
    private let ipadReuseIdentifier = "IpadCell"
    var detailViewController: DetailViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appsViewModel.currentApps.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = AppCollectionViewCell()
        
        switch UIDevice.currentDevice().userInterfaceIdiom {
        case .Phone:
            cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! AppCollectionViewCell
        default:
            cell = collectionView.dequeueReusableCellWithReuseIdentifier(ipadReuseIdentifier, forIndexPath: indexPath) as! AppCollectionViewCell
        }
        
        let app = appsViewModel.currentApps[indexPath.row]
        cell.configureCellWithApp(app)
        Animate.cellAparation(cell)
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        let selectedApp = appsViewModel.currentApps[indexPath.row]
        Animate.cellSelected(cell!, animationFinished: {
            
            self.performSegueWithIdentifier("showAppInfo", sender: selectedApp)
        })
        

    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        switch UIDevice.currentDevice().userInterfaceIdiom {
        case .Phone:
            return CGSizeMake(collectionView.frame.width - 20.0, 60.0)
        default:
            let cellWidth = (collectionView.frame.width / 4.0) - 20.0
            return CGSizeMake(cellWidth, cellWidth)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showAppInfo") {
            let detailViewController = segue.destinationViewController as! DetailViewController
            let app = sender as! AppInfo
            detailViewController.detailViewModel.appInfo = app
        }
    }
}
