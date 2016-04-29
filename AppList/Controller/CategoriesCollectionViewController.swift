//
//  CategoriesCollectionViewController.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/26/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import UIKit
import RealmSwift

private let reuseIdentifier = "Cell"

class CategoriesCollectionViewController: UICollectionViewController {
    
    private let categoriesViewModel = CategoriesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesViewModel.categories.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CategoryCollectionViewCell
        cell.configureCellWithCategory(categoriesViewModel.categories[indexPath.row])
        Animate.cellAparation(cell)
        return cell
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
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        let category = categoriesViewModel.categories[indexPath.row]
        let appsOfCategory = categoriesViewModel.categoriesDictionary[category]
        Animate.cellSelected(cell!, animationFinished: {
            
            self.performSegueWithIdentifier("showApps", sender: appsOfCategory)
        })
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showApps") {
            let splitViewController = segue.destinationViewController as! AppListSplitViewController
            let appListController = splitViewController.childViewControllers.first!.childViewControllers.first as! AppsCollectionViewController
            let detailViewController = splitViewController.childViewControllers.last as! DetailViewController
            
            let apps = sender as! Results<AppInfo>
            appListController.appsViewModel.currentApps = apps
            detailViewController.detailViewModel.appInfo = apps.first!
        }
    }
    
}
