//
//  CategoriesCollectionViewController.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/26/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CategoriesCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        //        collectionView?.contentInset = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 40.0)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
        
        // Configure the cell
        if(indexPath.row % 2 == 0) {
            cell.layer.borderColor = UIColor.orangeColor().CGColor
            
            //            cell.backgroundColor = UIColor.orangeColor()
        }else {
            cell.layer.borderColor = UIColor.grayColor().CGColor
            //            cell.backgroundColor = UIColor.grayColor()
        }
        
        cell.layer.cornerRadius = 8.0
        cell.layer.borderWidth = 2.0
        cell.layer.shadowColor = cell.layer.borderColor
        cell.layer.shadowOffset = CGSizeMake(4.00, 0)
        cell.layer.shadowOpacity = 1.0
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowPath = UIBezierPath(roundedRect: CGRectMake(0.0, cell.bounds.height, cell.bounds.width, 10.0), cornerRadius: 8.0).CGPath
        cell.clipsToBounds = false
        cell.layer.masksToBounds = false
        
        //        cell.clipsToBounds = true
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 4.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 4.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        switch UIDevice.currentDevice().userInterfaceIdiom {
        case .Phone:
            return CGSizeMake(collectionView.frame.width - 20.0, 60.0)
        default:
            let cellWidth = (collectionView.frame.width / 6.0) - 4.0
            return CGSizeMake(cellWidth, cellWidth)
        }
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return false
     }
     
     override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
     return false
     }
     
     override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
     
     }
     */
    
}
