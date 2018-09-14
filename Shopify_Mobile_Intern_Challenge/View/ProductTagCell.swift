//
//  ProductTagCell.swift
//  Shopify_Mobile_Intern_Challenge
//
//  Created by VICTOR CHU on 2018-09-13.
//  Copyright © 2018 Victor Chu. All rights reserved.
//

import UIKit
import Alamofire

class ProductTagCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productInventoryLabel: UILabel!
    
    func configureCell(productImageURL: String, productNameLabel: String, productIventoryLabel: String) {
        self.productNameLabel.text = productNameLabel
        self.productInventoryLabel.text = "Total Inventory Count: " + productIventoryLabel
        
        Alamofire.request(productImageURL).responseData { (response) in
            if let image = response.result.value {
                let uiimage = UIImage(data: image)
                self.productImage.image = uiimage
            }
        }
        
    }

}
