//: Playground - noun: a place where people can play

import UIKit
var hCount = 0
var tCount = 0

func tossCoin() -> String {
    print("Tossing a Coin")
    let coin: Int = Int(arc4random_uniform(2) + 1)
    if coin % 2 == 0 {
        return "Heads"
    }else {
        return "Tails"
    }
    
}

tossCoin()

func tossMultipleCoins(tosses: Int) -> Double {
    
    var hCount = 0
    var tCount = 0
    
    for _ in 0...tosses {
        if tossCoin() == "Heads" {
            hCount += 1
        }else {
            tCount += 1
        }
    }
    
    return Double(tosses) / Double(hCount)
}


tossMultipleCoins(tosses: 10)