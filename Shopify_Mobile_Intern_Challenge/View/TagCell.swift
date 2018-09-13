//
//  TagCell.swift
//  Shopify_Mobile_Intern_Challenge
//
//  Created by VICTOR CHU on 2018-09-12.
//  Copyright © 2018 Victor Chu. All rights reserved.
//

import UIKit

class TagCell: UITableViewCell {

    @IBOutlet weak var tagLabel: UILabel!
    
    func configureCell(tag: String) {
        self.tagLabel.text = tag
    }

}
