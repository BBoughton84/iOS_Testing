//: Playground - noun: a place where people can play

import UIKit
//import NSURLSession
import Alamofire


//var str = "Hello, playground"
//
//print(str)
//
//var newObject : [String:Int] = ["age":233, "breed":33]
//
//print(newObject["breed"]!)
//
//var realDictionary = ["Happy":"full of excitement", "Sad":"not happy", "Swift":"Swift SUCKS"]
//
//realDictionary["Swift"] = "REALLY SUCKS"
//
//realDictionary["Swift"]
//
//realDictionary["Billy"] = "learning swift"
//
//print(realDictionary)
//
//realDictionary.removeValue(forKey: "Swift")
//
//print(realDictionary)


//super.viewDidLoad()
// Do any additional setup after loading the view, typically from a nib.

//let urlString = URL(string: "https://pantrysupply.herokuapp.com/getall")
//if let url = urlString {
//    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//        if error != nil {
//            print(error)
//        } else {
//            if let usableData = data {
//                print(usableData) //JSONSerialization
//            }
//        }
//    }
//    task.resume()


Alamofire.request("https://pantrysupply.herokuapp.com/getall").responseString { response in
    debugPrint(response)
    
    if let json = response.result.value {
        print("JSON: \(json)")
    }
}