//
//  ProductTagCell.swift
//  Shopify_Mobile_Intern_Challenge
//
//  Created by VICTOR CHU on 2018-09-13.
//  Copyright © 2018 Victor Chu. All rights reserved.
//

import UIKit

class ProductTagCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productInventoryLabel: UILabel!
    
    func configureCell(productImage: String, productNameLabel: String, productIventoryLabel: String) {
        
        //self.productImage =
        self.productNameLabel.text = productNameLabel
        self.productInventoryLabel.text = productIventoryLabel
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
