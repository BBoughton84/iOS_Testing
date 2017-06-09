//: Playground - noun: a place where people can play

import UIKit



////let str = ShareArray.datesIn[indexPath.row] as? String
//let longDateOut = "Fri, 02 Jun 2017 19:56:59 GMT"
//let shortDateOut = String(longDateOut.characters.dropLast(4))
//
//
//let dateFormatterOUT = DateFormatter()
//dateFormatterOUT.dateFormat = "EE, dd MM yyyy HH:mm:ss"
//
//let ns_date2 = dateFormatterOUT.date(from: shortDateOut)
//
//dateFormatterOUT.dateFormat = "EE, MMM d"
//
//let shorterDateOUT = dateFormatterOUT.string(from: ns_date2!)
//print(shorterDateOUT)

 var datesOut : [Any] = []



//let longDateOut = ShareArray.datesOut[((ShareArray.datesIn.count - indexPath.row) - 1)] as? String
//let shortDateOut = String(longDateOut!.characters.dropLast(4))

//let dateFormatterOUT = DateFormatter()
//dateFormatterOUT.dateFormat = Date()
//let ns_date2 = dateFormatterOUT.date(from: Date())
//dateFormatterOUT.dateFormat = "EE, MMM d"
//let shorterDateOUT = dateFormatterOUT.string(from: ns_date2!)
//
//print(shorterDateOUT)

//
//let strDate = String(describing: Date())
//let updateOUT = DateFormatter()
//updateOUT.dateFormat = "yyyy-MM-dd HH:mm:ssZZZZ"
//let ns_date3 = updateOUT.date(from: strDate)
//updateOUT.dateFormat = "EE, dd MMM yyyy HH:mm:ss ZZZZ"
//let newDateOut = updateOUT.string(from: ns_date3!)
//let shortDate = String(newDateOut.characters.dropLast(6))
//
//
//print(shortDate)



let refreshAlert = UIAlertController(title: "Refresh", message: "All data will be lost.", preferredStyle: UIAlertControllerStyle.alert)

refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
    print("Handle Ok logic here")
}))

refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
    print("Handle Cancel Logic here")
}))

(refreshAlert, animated: true, completion: nil)

