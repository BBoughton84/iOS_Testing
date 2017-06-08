//
//  ShowOneFoodItemViewController.swift
//  customTableViewsExample
//
//  Created by Bill Boughton on 6/7/17.
//  Copyright © 2017 Bill Boughton. All rights reserved.
//

import UIKit
import Alamofire


class ShowOneFoodItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dateInStatic: UILabel!
    @IBOutlet weak var dateOutStatic: UILabel!
    

    @IBOutlet weak var quantityDisplay: UILabel!
    @IBOutlet weak var textNameDisplay: UILabel!
    @IBOutlet weak var textItemDisplay: UILabel!
    @IBOutlet weak var aveDay: UILabel!

    @IBOutlet weak var tableView: UITableView!
    
    var indexOfItem = 0
    var idHolder = ""
    var arrayDateIN = [NSArray]()
    var arrayDateOUT = [NSArray]()
    var difference = [NSArray]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        idHolder = SharedData.items[indexOfItem]["item_id"] as! String
        getMoreFoodData(idHolder: idHolder)
        textItemDisplay.text = SharedData.items[indexOfItem]["brand_item"] as? String
        textNameDisplay.text = SharedData.items[indexOfItem]["item_name"] as? String
        quantityDisplay.text = String(describing: SharedData.items[indexOfItem]["quantity"]!!)
        dateInStatic.text = "Date In"
        dateOutStatic.text = "Date Out"
        
//        let testHolder = SharedData.items[indexOfItem]["quantity"] as! Int!
//        let nextTestHolder = Int(testHolder!) + 1
//        print(nextTestHolder)
//        SharedData.items[indexOfItem]["quantity"] += 1 as Any!
        
    }

    func getMoreFoodData(idHolder: String){
        Alamofire.request("https://pantrysupply.herokuapp.com/getone/\(idHolder)").responseJSON { response in
            
            if let JSON = response.result.value as AnyObject?{
//                                print("JSON: \(JSON)")
                self.arrayDateIN = (JSON["date_added"] as! NSArray) as! [NSArray]
                ShareArray.datesIn = (JSON["date_added"] as! NSArray) as! [Any]
                ShareArray.datesOut = (JSON["date_removed"] as! NSArray) as! [Any]
                ShareArray.difference = (JSON["difference"] as! NSArray) as! [Any]
                self.aveDay.text = JSON["ave_day"] as? String
                self.tableView.reloadData()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShareArray.datesIn.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let datecell = tableView.dequeueReusableCell(withIdentifier: "datecell", for: indexPath) as! DateDisplayTableViewCell
        
        let str = ShareArray.datesIn[((ShareArray.datesIn.count - indexPath.row) - 1)] as? String
        let shortStr = String(str!.characters.dropLast(4))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE, dd MM yyyy HH:mm:ss"
        let ns_date1 = dateFormatter.date(from: shortStr)
        dateFormatter.dateFormat = "EE, MMM d"
        let shorterDate = dateFormatter.string(from: ns_date1!)
        
        datecell.labelDateIn.text = shorterDate
        
        if (indexPath.row < (ShareArray.datesIn.count - ShareArray.datesOut.count)) {
            
            datecell.labelDateOut.text = "-"
            
        } else {
            
            let longDateOut = ShareArray.datesOut[((ShareArray.datesIn.count - indexPath.row) - 1)] as? String
            let shortDateOut = String(longDateOut!.characters.dropLast(4))
            
            let dateFormatterOUT = DateFormatter()
            dateFormatterOUT.dateFormat = "EE, dd MM yyyy HH:mm:ss"
            
            let ns_date2 = dateFormatterOUT.date(from: shortDateOut)
            dateFormatterOUT.dateFormat = "EE, MMM d"
            let shorterDateOUT = dateFormatterOUT.string(from: ns_date2!)
            
            datecell.labelDateOut.text = shorterDateOUT
            
        }
        
        
        return datecell
    }
    
    @IBAction func increaseQuantity(_ sender: Any) {

        let currentDisplayQuantity = quantityDisplay.text
        let increasedDisplayHolder = Int(currentDisplayQuantity!)! + 1
        quantityDisplay.text = String(describing: increasedDisplayHolder)
        
        print(idHolder)
        
        Alamofire.request("https://pantrysupply.herokuapp.com/adjustup/\(idHolder)").responseJSON { responseUp in
            if let dataFromAdjustUp = responseUp.result.value as AnyObject?{
                print("JSON: \(dataFromAdjustUp)")
            }
            self.tableView.reloadData()
//            ViewController().tableView.reloadData()
        }
        
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
    @IBAction func decreaseQuantity(_ sender: Any) {
        
        if quantityDisplay.text == "0" {
            print("Item is already at zero")
        } else {
            let currentDisplayQuantity = quantityDisplay.text
            let decreasedDisplayHolder = Int(currentDisplayQuantity!)! - 1
            quantityDisplay.text = String(describing: decreasedDisplayHolder)
            
            Alamofire.request("https://pantrysupply.herokuapp.com/adjustdown/\(idHolder)").responseJSON { responseDown in
                if let dataFromAdjustDown = responseDown.result.value as Any?{
                    print("JSON: \(dataFromAdjustDown)")
                }
                self.tableView.reloadData()
//                ViewController().tableView.reloadData()

            }
            
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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
