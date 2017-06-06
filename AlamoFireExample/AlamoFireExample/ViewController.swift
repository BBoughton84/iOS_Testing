//
//  ViewController.swift
//  AlamoFireExample
//
//  Created by Bill Boughton on 6/6/17.
//  Copyright © 2017 Bill Boughton. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        Alamofire.request("https://pantrysupply.herokuapp.com/getall").responseJSON { response in
            print(response.request!)  // original URL request
            print(response.response!) // HTTP URL response
            print(response.data!)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                if let result = JSON["JSON"] as? NSDictionary{
                    print(result)
                }
//                print(JSON["result"] as! String)
//                print(JSON["result"] as! NSObject)

            }
        }
//    Alamofire.request("https://pantrysupply.herokuapp.com/getall").responseData { response in
//        debugPrint("All Response Info: \(response)")
//        
//        if let data = response.result.value, let utf8Text = String(data: data, encoding: .utf8) {
//            print("Data: \(utf8Text)")
////            print(data["result"] as! NSArray)
//        }
//    }
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

