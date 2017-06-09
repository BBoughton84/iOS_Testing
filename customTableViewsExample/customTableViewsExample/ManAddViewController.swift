//
//  ManAddViewController.swift
//  customTableViewsExample
//
//  Created by Bill Boughton on 6/9/17.
//  Copyright © 2017 Bill Boughton. All rights reserved.
//

import UIKit
import Alamofire

class ManAddViewController: UIViewController {

    @IBOutlet weak var quantityInput: UITextField!
    @IBOutlet weak var itemNameInput: UITextField!
    @IBOutlet weak var brandInput: UITextField!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveNewItem(_ sender: Any) {
        let qtyHolder = quantityInput.text!
        let itemNameHolder = itemNameInput.text!
        let brandHolder = brandInput.text!
        print(qtyHolder)
        print(itemNameHolder)
        print(brandHolder)

        let dataToSend: Parameters = ["brand_name":brandHolder, "item_name":itemNameHolder, "quantity":qtyHolder]
        
        Alamofire.request("https://pantrysupply.herokuapp.com/insertman", method: .post, parameters: dataToSend).responseJSON { response in
            print(response.request!)
            print(response.result)
        }
        
        
        self.navigationController!.popViewController(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
