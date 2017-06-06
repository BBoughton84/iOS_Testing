//: Playground - noun: a place where people can play

import UIKit

var str :String? = "Hello, playground"

var age :Int? = 33

print(age!)

print(str)

func stringToInt(someString : String) -> Int? {
    return 4
}



print(stringToInt(someString: "55"))
var newInt = Int("55")

print(newInt)

if let newAge = age{
    print(newAge)
}

class Task {
    var name = ""
    var important = false
}

let task : Task? = nil
task?.name = "take trash out"
print(task?.name)


