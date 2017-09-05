import UIKit

func printArr () {
    var funArr: [Any] = [0]
    var i = 0
    
    
    while i < 256 {
        let randomNumber: Int = Int(arc4random_uniform(100) + 1)
        var q: Int = randomNumber
        if q % 5 == 0 {
            funArr.append(q)
            i += 1
        } else if (i == 42) {
            funArr.append("We found the answer to the Ultimate Question of Life, the Universe, and Everything at index \(i)")
            i += 1
        } else {
            funArr.append(i)
            i += 1
            print(q)
        }
        print("This is the Array: \(funArr)")
    }
}

printArr()