//
//  Product.swift
//  Aneke
//
//  Created by Luis Del Giudice on 9/4/15.
//  Copyright (c) 2015 Luis Del Giudice. All rights reserved.
//

import UIKit

class Product: NSObject {
    
    var name: String
    var product_description: String
    var category: String
    var company: String
    
    required init(data: NSDictionary) {
        self.name = data["name"] as! String
        self.product_description = data["description"] as! String
        self.category = data["category"] as! String
        self.company = data["company"] as! String
        
    }
    
    class func all(params: String, callBack: ([Product]) -> () ) {
        let url = NSURL(string: Settings.API_ROOT + "/products?" + params)!
        let request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
            (response, data, error) in
            let result = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSArray
            
            var queryset = [Product]()
            for (product_json) in result {
                queryset.append(Product(data: product_json as! NSDictionary))
            }
            callBack(queryset)
        }
    }
   
}
