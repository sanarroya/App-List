//
//  AppsCollectionViewController.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/29/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class AppsCollectionViewController: UICollectionViewController {

    let appsViewModel = AppsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem(image: UIImage(named: "back"), style: .Plain, target: self, action: #selector(goBack))
        navigationItem.leftBarButtonItem = backButton
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

    func goBack() {
        self.performSegueWithIdentifier("goBack", sender: nil)
    }
}
