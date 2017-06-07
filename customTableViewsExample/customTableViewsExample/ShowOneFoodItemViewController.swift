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
//        print(idHolder)
        textItemDisplay.text = SharedData.items[indexOfItem]["brand_item"] as? String
        textNameDisplay.text = SharedData.items[indexOfItem]["item_name"] as? String
        quantityDisplay.text = String(describing: SharedData.items[indexOfItem]["quantity"]!!)
        dateInStatic.text = "Date In"
        dateOutStatic.text = "Date Out"
        
    }

    func getMoreFoodData(idHolder: String){
        print(idHolder)
        Alamofire.request("https://pantrysupply.herokuapp.com/getone/\(idHolder)").responseJSON { response in
            
            if let JSON = response.result.value as AnyObject?{
//                                print("JSON: \(JSON)")
                self.arrayDateIN = (JSON["date_added"] as! NSArray) as! [NSArray]
                ShareArray.datesIn = (JSON["date_added"] as! NSArray) as! [Any]
                ShareArray.datesOut = (JSON["date_removed"] as! NSArray) as! [Any]
//                self.arrayDateOUT = (JSON["date_removed"] as! NSArray) as! [NSArray]
//                self.difference = (JSON["difference"] as! NSArray) as! [NSArray]
//                print(ShareArray.datesIn)
//                print(ShareArray.datesOut)

                self.tableView.reloadData()

            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShareArray.datesIn.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let datecell = tableView.dequeueReusableCell(withIdentifier: "datecell", for: indexPath) as! DateDisplayTableViewCell
        print(indexPath.row)
        print(ShareArray.datesIn[indexPath.row])
        datecell.labelDateIn.text = ShareArray.datesIn[indexPath.row] as? String
        if (indexPath.row < ShareArray.datesOut.count) {
            datecell.labelDateOut.text = ShareArray.datesOut[indexPath.row] as? String
        } else {
            datecell.labelDateOut.text = "-"
        }
        return datecell
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
