//
//  ViewController.swift
//  AlamoFireExample
//
//  Created by Bill Boughton on 6/6/17.
//  Copyright © 2017 Bill Boughton. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let list = ["mile", "Honey", "bread", "tacos"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        return(cell)
    }
    
    
    var arrayHolder :[String:String] = ["":""]
    var foodHolder : [String:String] = ["":""]
    var allFoods : [Food] = []
    var everyThing = [AnyObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        
        
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
                        print(i)
//                        print(nextArray.count)
                        let nextTempHolder = nextArray[i] as AnyObject?
//                        print(nextTempHolder!)
//                        let finalHolder = String(describing: nextTempHolder?["quantity"]) as String
                        let finalHolder = nextTempHolder?["quantity"] as! Int
                        let idHolder = nextTempHolder?["item_id"] as! String?
                        let brandNameHolder = nextTempHolder?["brand_name"] as! String?
                        let itemName = nextTempHolder?["item_name"] as! String?
                        someDict["brand_item"] = brandNameHolder! as AnyObject
                        someDict["item_name"] = itemName as AnyObject
                        someDict["item_id"] = idHolder as AnyObject
                        someDict["quantity"] = finalHolder as AnyObject
                        self.everyThing.append(someDict as AnyObject)
                    }
                   print(self.everyThing[0]["brand_item"]!!)
                }
            }
            
        }
        
//        tableView.dataSource = self
//        tableView.delegate = self
        
    }

    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return everyThing.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
////        let newFood = everyThing[indexPath.row]
////        cell.textLabel?.text = newFood as! String
//        cell.textLabel?.text = everyThing[indexPath.row] as! String
//
//        return cell
//    }
    
    
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return everyThing.count
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return everyThing.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //perform segue in here
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        <#code#>
//    }
//
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

