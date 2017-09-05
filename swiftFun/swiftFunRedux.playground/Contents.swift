//: Playground - noun: a place where people can play

import UIKit

var number = 2
if number % 2 == 0 {
    print("Number is even")
} else {
    print("Number is odd")
}

for i in 1...100{
    if i % 3 == 0 {
        print ("This number is divisible by 3: \(i)")
        print ("Fizz")
    } else if i % 5 == 0 {
        print ("This number is divisible by 5: \(i)")
        print ("Buzz")
    } else if ( i % 3 == 0 && i % 5 == 0) {
        print ("This number is divisible by 3 & 5: \(i)")
        print ("FizzBuzz")
    }
}

//var num = 0
//while num <= 255 {
//    print ("This is the number: \(number)")
//    number+=1
//}

