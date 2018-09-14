//
//  ProductTag.swift
//  Shopify_Mobile_Intern_Challenge
//
//  Created by VICTOR CHU on 2018-09-13.
//  Copyright © 2018 Victor Chu. All rights reserved.
//

import Foundation

class Product {
    private var _productTitle: String
    private var _inventoryCount: String
    private var _imageURL: String
    
    var productTitle: String {
        return _productTitle
    }
    
    var inventoryCount: String {
        return _inventoryCount
    }
    
    var imageURL: String {
        return _imageURL
    }
    
    init(productTitle: String, inventoryCount: String, imageURL: String) {
        self._productTitle = productTitle
        self._inventoryCount = inventoryCount
        self._imageURL = imageURL
    }

}
