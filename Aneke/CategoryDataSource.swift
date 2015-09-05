//
//  CategoryDataSource.swift
//  Aneke
//
//  Created by Luis Del Giudice on 9/4/15.
//  Copyright (c) 2015 Luis Del Giudice. All rights reserved.
//

import UIKit

class CategoryDataSource: NSObject, UITableViewDataSource {
    
    var queryset: [Product]?
    var tableViewController: UITableViewController
    var category: String
    
    init (controller: UITableViewController, category: String) {
        self.tableViewController = controller
        self.category = category
        super.init()
        let refreshControll = UIRefreshControl()
        refreshControll.addTarget(self, action: "reload", forControlEvents: UIControlEvents.ValueChanged)
        self.tableViewController.refreshControl = refreshControll
        self.reload()
       
    }
    
    func reload() {
        self.tableViewController.refreshControl?.beginRefreshing()
        Product.all("category__name=" + self.category) {
            products in
            self.setQuerySet(products)
            self.tableViewController.tableView.dataSource = self
            self.tableViewController.tableView.reloadData()
            self.tableViewController.refreshControl?.endRefreshing()
        }
    }
    
    func setQuerySet(queryset: [Product]) {
        self.queryset = queryset
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.queryset != nil) {
            return self.queryset!.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("productCell") as! ProductTableViewCell
        cell.setProduct(queryset![indexPath.row])
        return cell
    }
   
}
