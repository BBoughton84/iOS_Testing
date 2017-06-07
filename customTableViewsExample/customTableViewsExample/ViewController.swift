//
//  ViewController.swift
//  customTableViewsExample
//
//  Created by Bill Boughton on 6/6/17.
//  Copyright © 2017 Bill Boughton. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!

    
    let animals = ["panda", "lion", "elefant"]
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFoodData()

//        tableView.dataSource = self
//        tableView.delegate = self
        
        print("hello")

    }
    
    func getFoodData() {
        Alamofire.request("https://pantrysupply.herokuapp.com/getall").responseJSON { response in
            //            print(response.request!)  // original URL request
            //            print(response.response!) // HTTP URL response
            //            print(response.data!)     // server data
            //            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value as AnyObject?{
                //                print("JSON: \(JSON)")
                if let nextArray = JSON["result"] as! NSArray?{
                    for i in 0..<nextArray.count{
                        var someDict = [String: AnyObject]()
                        let nextTempHolder = nextArray[i] as AnyObject?
                        let finalHolder = nextTempHolder?["quantity"] as! Int
                        let idHolder = nextTempHolder?["item_id"] as! String?
                        let brandNameHolder = nextTempHolder?["brand_name"] as! String?
                        let itemName = nextTempHolder?["item_name"] as! String?
                        someDict["brand_item"] = brandNameHolder! as AnyObject
                        someDict["item_name"] = itemName as AnyObject
                        someDict["item_id"] = idHolder as AnyObject
                        someDict["quantity"] = finalHolder as AnyObject
                        SharedData.items.append(someDict as AnyObject)
                    }
                    self.tableView.reloadData()
                }
            }
            
        }
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SharedData.items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        cell.myImage.image = UIImage(named: "pic.png")
//        cell.myLabel.text = animals[indexPath.row]
//        cell.myLabel.text = "hello"
        print(indexPath.row)
        print(SharedData.items[indexPath.row])
        cell.myLabel.text = SharedData.items[indexPath.row]["brand_item"] as? String

        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

