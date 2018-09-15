//
//  ViewController.swift
//  Shopify_Mobile_Intern_Challenge
//
//  Created by VICTOR CHU on 2018-09-12.
//  Copyright © 2018 Victor Chu. All rights reserved.
//

import UIKit
import Alamofire

class TagVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let URL = "https://shopicruit.myshopify.com/admin/products.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"
    var tagArray = [String]()
    var tagDestination = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        Alamofire.request(URL).responseJSON { (response) in
            
            if response.result.isSuccess {
                if let result = response.result.value {

                    let jsonDict : Dictionary =  result as! Dictionary <String, Any>
                    if let productArray : Array = jsonDict["products"] as? Array <Dictionary <String, Any>> {
                        for product in productArray {
                            let tags = product["tags"] as! String
                            let tagsArray = tags.components(separatedBy: ", ")
                            for tag in tagsArray {
                                if !self.tagArray.contains(tag) {
                                    self.tagArray.append(tag)
                                }
                            }
                        }
                        self.tableView.reloadData()
                    }

                }
            }
            else {
                print("Error \(String(describing: response.result.error))")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TagToProductTagSegue" {
            if let destinationVC = segue.destination as? ProductTagVC {
                destinationVC.tag = tagDestination
            }
        }
    }
}


extension TagVC: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tagArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TagCell") as? TagCell else { return UITableViewCell() }
        
        cell.configureCell(tag: tagArray[indexPath.row])

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tagDestination = tagArray[indexPath.row]
        performSegue(withIdentifier: "TagToProductTagSegue", sender: self)
    }
}

