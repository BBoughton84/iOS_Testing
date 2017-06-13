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
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        getFoodData()
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getFoodData()

    }
    
    func getFoodData() {
        Alamofire.request("https://pantrysupply.herokuapp.com/getall").responseJSON { response in
            
            if let JSON = response.result.value as AnyObject?{
                //                print("JSON: \(JSON)")
                if let nextArray = JSON["result"] as! NSArray?{
                    SharedData.items.removeAll()
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
        cell.myQuantity.text = String(describing: SharedData.items[indexPath.row]["quantity"]!!)
        cell.myLabel.text = SharedData.items[indexPath.row]["item_name"] as? String
        cell.myBrandName.text = SharedData.items[indexPath.row]["brand_item"] as? String
        cell.myQuantity.textColor = UIColor.black
        cell.myBrandName.textColor = UIColor.black
        cell.myLabel.textColor = UIColor.black
        if (String(describing: SharedData.items[indexPath.row]["quantity"]!!) == "0") {
            print(String(describing: SharedData.items[indexPath.row]["quantity"]!!))
            print(SharedData.items[indexPath.row]["item_name"] as? String)
            cell.myQuantity.textColor = UIColor.red
            cell.myBrandName.textColor = UIColor.red
            cell.myLabel.textColor = UIColor.red
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexClicked = indexPath.row
        performSegue(withIdentifier: "moveSegue", sender: indexClicked)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if (segue.identifier == "moveSegue"){
            let showOne = segue.destination as! ShowOneFoodItemViewController
            showOne.indexOfItem = sender as! Int
            
        } else if (segue.identifier == "manualEntry") {
            segue.destination as! ManAddViewController
        }

    }
    
    @IBAction func addNewItem(_ sender: Any) {
        performSegue(withIdentifier: "manualEntry", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

