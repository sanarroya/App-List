//
//  DetailViewController.swift
//  AppList
//
//  Created by Santiago Avila Arroyave on 4/29/16.
//  Copyright © 2016 Santiago Avila Arroyave. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let detailViewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(detailViewModel.appInfo.name)
        // Do any additional setup after loading the view.
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
