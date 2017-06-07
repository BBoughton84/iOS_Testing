//
//  ShowOneFoodItemViewController.swift
//  customTableViewsExample
//
//  Created by Bill Boughton on 6/7/17.
//  Copyright © 2017 Bill Boughton. All rights reserved.
//

import UIKit

class ShowOneFoodItemViewController: UIViewController {
    
//    @IBOutlet weak var itemNameDisplay: UILabel!
    
    @IBOutlet weak var quantityDisplay: UILabel!
    @IBOutlet weak var textNameDisplay: UILabel!
    @IBOutlet weak var textItemDisplay: UILabel!

    
    var indexOfItem = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(SharedData.items[indexOfItem]["brand_item"] as! String)
//        itemNameDisplay.text = SharedData.items[indexOfItem]["brand_item"] as! String
        textItemDisplay.text = SharedData.items[indexOfItem]["brand_item"] as! String
        textNameDisplay.text = SharedData.items[indexOfItem]["item_name"] as! String
        quantityDisplay.text = String(describing: SharedData.items[indexOfItem]["quantity"]!!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
