//
//  ShowOneFoodItemViewController.swift
//  customTableViewsExample
//
//  Created by Bill Boughton on 6/7/17.
//  Copyright © 2017 Bill Boughton. All rights reserved.
//

import UIKit

class ShowOneFoodItemViewController: UIViewController {
    
    @IBOutlet weak var itemNameShow: UILabel!
    @IBOutlet weak var itemNameDisplay: UILabel!
    var indexOfItem = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(SharedData.items[indexOfItem])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
