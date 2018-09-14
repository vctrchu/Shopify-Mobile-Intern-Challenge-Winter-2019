//
//  ProductTagVC.swift
//  Shopify_Mobile_Intern_Challenge
//
//  Created by VICTOR CHU on 2018-09-12.
//  Copyright © 2018 Victor Chu. All rights reserved.
//

import UIKit
import Alamofire

class ProductTagVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tagLabel: UILabel!
    let URL = "https://shopicruit.myshopify.com/admin/products.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"
    var tag = ""
    var productsArray = [Product]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tagLabel.text = tag
        
        Alamofire.request(URL).responseJSON { (response) in
            
            if response.result.isSuccess {
                if let jsonArray = response.result.value {
                    
                    let jsonObject : Dictionary =  jsonArray as! Dictionary <String, Any>
                    if let productObject : Array = jsonObject["products"] as? Array <Dictionary <String, Any>> {
                        for product in productObject {
                            
                            let tags = product["tags"] as! String
                            let productTitle = product["title"] as! String
                            var inventoryCount = 0
                            print(tags)
                            
                            let variants = product["variants"] as! Array <Dictionary <String, Any>>
                            for variant in variants {
                                inventoryCount += variant["inventory_quantity"] as! Int
                            }
                            
                            let image = product["image"] as! Dictionary <String, Any>
                            let imageURL = image["src"] as! String
                            
                            let tagsArr = tags.components(separatedBy: ", ")
                            if tagsArr.contains(self.tag) {
                                let tempProduct = Product(productTitle: productTitle, inventoryCount: String(inventoryCount), imageURL: imageURL)
                                self.productsArray.append(tempProduct)
                            }
                        }
                        self.tableView.reloadData()
                    }
                    
                }
            }
            else {
                print("error")
            }
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

extension ProductTagVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTagCell") as? ProductTagCell else { return UITableViewCell() }
        
        let product = productsArray[indexPath.row]
        cell.configureCell(productImageURL: product.imageURL, productNameLabel: product.productTitle, productIventoryLabel: product.inventoryCount)
        
        return cell
    }
    
}
