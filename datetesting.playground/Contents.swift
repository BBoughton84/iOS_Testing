//: Playground - noun: a place where people can play

import UIKit

//extension Date {
//    var localTime: String {
//        return description(with: Locale.current)
//    }
//}
//
//@IBAction func datePickerChanged(_ sender: UIDatePicker) {
//    let formatter = DateFormatter()
//    formatter.dateFormat = "dd.MM.yyyy HH:mm"
//    
//    let dateLabel.text = formatter.string(from: sender.date)
//    print(dateLabel)
//}


//var name: String = "Fri, 22 Jun 2017 20:25:59 GMT"
//let endIndex = name.index(name.endIndex, offsetBy: -4)
//let truncated = name.substring(to: endIndex)
//print(name)
//print(truncated)
//
//let str = "Fri, 02 Jun 2017 20:25:59 GMT"
//let result = String(str.characters.dropLast(4))
//
//
//let dateFormatter = DateFormatter()
//dateFormatter.dateFormat = "EE, dd MM yyyy HH:mm:ss"
////dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//
////let ns_date1 = dateFormatter.date(from: "Fri, 02 Jun 2017 20:25:59")
//let ns_date1 = dateFormatter.date(from: result)
//
////dateFormatter.dateFormat = "EE, MM-dd @ hh':'mm a"
//dateFormatter.dateFormat = "EE, MMM d"
//
//
//let string = dateFormatter.string(from: ns_date1!)
//
//print(string)

//MM-dd-yyyy
//Mon, Jun 02



//let str = ShareArray.datesIn[indexPath.row] as? String
let longDateOut = "Fri, 02 Jun 2017 19:56:59 GMT"
let shortDateOut = String(longDateOut.characters.dropLast(4))


let dateFormatterOUT = DateFormatter()
dateFormatterOUT.dateFormat = "EE, dd MM yyyy HH:mm:ss"

let ns_date2 = dateFormatterOUT.date(from: shortDateOut)

dateFormatterOUT.dateFormat = "EE, MMM d"

let shorterDateOUT = dateFormatterOUT.string(from: ns_date2!)
print(shorterDateOUT)









