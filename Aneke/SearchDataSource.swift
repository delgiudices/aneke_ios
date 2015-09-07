//
//  SearchDataSource.swift
//  Aneke
//
//  Created by Luis Del Giudice on 9/6/15.
//  Copyright (c) 2015 Luis Del Giudice. All rights reserved.
//

import UIKit

class SearchDataSource: NSObject, UITableViewDataSource {
    
    var searchText: String?
    var queryset: [Product] = []
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return queryset.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("productCell") as! ProductTableViewCell
        cell.setProduct(queryset[indexPath.row])
        return cell
    }
    
    func loadSearchData(controller: ProductsTableViewController, querystring: String) {
        controller.tableView.dataSource = self
        Product.filter(querystring) {
            (products) in
            self.queryset = products as [Product]
            controller.tableView.reloadData()
        }
        
    }
    
}
