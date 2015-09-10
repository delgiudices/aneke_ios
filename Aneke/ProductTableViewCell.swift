//
//  ProductTableViewCell.swift
//  Aneke
//
//  Created by Luis Del Giudice on 9/5/15.
//  Copyright (c) 2015 Luis Del Giudice. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productCompanyLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    func setProduct(product: Product) {
        self.productCompanyLabel.text = product.company
        self.productNameLabel.text = product.name as String
        product.getImage() {
            (image) in
            self.productImage.image = image
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
