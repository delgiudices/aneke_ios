//
//  SearchController.swift
//  Aneke
//
//  Created by Luis Del Giudice on 9/5/15.
//  Copyright (c) 2015 Luis Del Giudice. All rights reserved.
//

import UIKit

class SearchController: UINavigationController {
    
    required override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let controller = self.viewControllers[0] as! ProductsTableViewController
        var searchBar: UISearchBar = UISearchBar(frame: CGRectMake(0, 0, 200, 20))
        controller.setTheSearchBar(searchBar)
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()

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
