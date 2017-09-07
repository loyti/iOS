//
//  ViewController.swift
//  rGame
//
//  Created by Brice Prather on 9/6/17.
//  Copyright © 2017 Life On Your Terms, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // create an array that stores the values of pressed places
    var pressedPlace = [Int]()
    
    // create a flag for each place to determined press state
    var bOne = false
    var bTwo = false
    var bThree = false
    var bFour = false
    var bFive = false
    var bSix = false
    var bSeven = false
    var bEight = false
    var bNine = false
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    
    // count the presses to check if divisible by 2
    var pressCount = 0
    
    // create the victory array
    // ["red", "red", "red", "red", "red", "red", "red", "red", "red"]
    // ["blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue"]
    var victory = ["grey","grey","grey","grey","grey","grey","grey","grey","grey"]
    
    // create players
    var playerOne:String = "Red"
    var playerTwo:String = "Blue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.backgroundColor = UIColor.lightGray
        button2.backgroundColor = UIColor.lightGray
        button3.backgroundColor = UIColor.lightGray
        button4.backgroundColor = UIColor.lightGray
        button5.backgroundColor = UIColor.lightGray
        button6.backgroundColor = UIColor.lightGray
        button7.backgroundColor = UIColor.lightGray
        button8.backgroundColor = UIColor.lightGray
        button9.backgroundColor = UIColor.lightGray
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func buttonOne(_ sender: UIButton) {
        print("buttonOne pressed")
        if bOne == false {
            pressCount += 1
            bOne = true
            if pressCount % 2 == 1 {
                button1.backgroundColor = UIColor.red
                button1.setTitle("X", for: UIControlState.normal)
                victory[0] = "red"
            } else {
                button1.backgroundColor = UIColor.blue
                button1.setTitle("O", for: UIControlState.normal)
                victory[0] = "blue"
            }
        } else {
            print("Already Selected... Try Another")
        }
    }
    
    @IBAction func buttonTwo(_ sender: UIButton) {
        print("buttonTwo pressed")
        if bTwo == false {
            pressCount += 1
            bTwo = true
            if pressCount % 2 == 1 {
                button2.backgroundColor = UIColor.red
                button2.setTitle("X", for: UIControlState.normal)
            } else {
                button2.backgroundColor = UIColor.blue
                button2.setTitle("O", for: UIControlState.normal)
            }
        } else {
            print("Already Selected... Try Another")
        }
    }
    
    @IBAction func buttonThree(_ sender: UIButton) {
        print("buttonThree pressed")
        if bThree == false {
            bThree = true
            pressCount += 1
            if pressCount % 2 == 1 {
                button3.backgroundColor = UIColor.red
                button3.setTitle("X", for: UIControlState.normal)
            } else {
                button3.backgroundColor = UIColor.blue
                button3.setTitle("O", for: UIControlState.normal)
            }
        } else {
            print("Already Selected... Try Another")
        }
    }
    
    @IBAction func buttonFour(_ sender: UIButton) {
        print("buttonFour pressed")
        if bFour == false {
            bFour = true
            pressCount += 1
            if pressCount % 2 == 1 {
                button4.backgroundColor = UIColor.red
                button4.setTitle("X", for: UIControlState.normal)
            } else {
                button4.backgroundColor = UIColor.blue
                button4.setTitle("O", for: UIControlState.normal)
            }
        } else {
            print("Already Selected... Try Another")
        }
    }
    
    @IBAction func buttonFive(_ sender: UIButton) {
        print("buttonFive pressed")
        if bFive == false {
            bFive = true
            pressCount += 1
            if pressCount % 2 == 1 {
                button5.backgroundColor = UIColor.red
                button5.setTitle("X", for: UIControlState.normal)
            } else {
                button5.backgroundColor = UIColor.blue
                button5.setTitle("O", for: UIControlState.normal)
            }
        } else {
            print("Already Selected... Try Another")
        }
        
    }
    
    @IBAction func buttonSix(_ sender: UIButton) {
        print("buttonSix pressed")
        if bSix == false {
            bSix = true
            pressCount += 1
            if pressCount % 2 == 1 {
                button6.backgroundColor = UIColor.red
                button6.setTitle("X", for: UIControlState.normal)
            } else {
                button6.backgroundColor = UIColor.blue
                button6.setTitle("O", for: UIControlState.normal)
            }
        } else {
            print("Already Selected... Try Another")
        }
        
    }
    
    @IBAction func buttonSeven(_ sender: UIButton) {
        print("buttonSeven pressed")
        if bSeven == false {
            bSeven = true
            pressCount += 1
            if pressCount % 2 == 1 {
                button7.backgroundColor = UIColor.red
                button7.setTitle("X", for: UIControlState.normal)
            } else {
                button7.backgroundColor = UIColor.blue
                button7.setTitle("O", for: UIControlState.normal)
            }
        } else {
            print("Already Selected... Try Another")
        }
    }
    
    @IBAction func buttonEight(_ sender: UIButton) {
        print("buttonEight pressed")
        if bEight == false {
            bEight = true
            pressCount += 1
            if pressCount % 2 == 1 {
                button8.backgroundColor = UIColor.red
                button8.setTitle("X", for: UIControlState.normal)
            } else {
                button8.backgroundColor = UIColor.blue
                button8.setTitle("O", for: UIControlState.normal)
            }
        } else {
            print("Already Selected... Try Another")
        }
    }
    
    @IBAction func buttonNine(_ sender: UIButton) {
        print("buttonNine pressed")
        if bNine == false {
            bNine = true
            pressCount += 1
            if pressCount % 2 == 1 {
                button9.backgroundColor = UIColor.red
                button9.setTitle("X", for: UIControlState.normal)
            } else {
                button9.backgroundColor = UIColor.blue
                button9.setTitle("O", for: UIControlState.normal)
            }
        } else {
            print("Already Selected... Try Another")
        }
    }
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        print("Reset Button pressed")
        pressCount = 0
        bOne = false
        bTwo = false
        bThree = false
        bFour = false
        bFive = false
        bSix = false
        bSeven = false
        bEight = false
        bNine = false
        
        button1.setTitle(" ", for: UIControlState.normal)
        button2.setTitle(" ", for: UIControlState.normal)
        button3.setTitle(" ", for: UIControlState.normal)
        button4.setTitle(" ", for: UIControlState.normal)
        button5.setTitle(" ", for: UIControlState.normal)
        button6.setTitle(" ", for: UIControlState.normal)
        button7.setTitle(" ", for: UIControlState.normal)
        button8.setTitle(" ", for: UIControlState.normal)
        button9.setTitle(" ", for: UIControlState.normal)
        
        button1.backgroundColor = UIColor.lightGray
        button2.backgroundColor = UIColor.lightGray
        button3.backgroundColor = UIColor.lightGray
        button4.backgroundColor = UIColor.lightGray
        button5.backgroundColor = UIColor.lightGray
        button6.backgroundColor = UIColor.lightGray
        button7.backgroundColor = UIColor.lightGray
        button8.backgroundColor = UIColor.lightGray
        button9.backgroundColor = UIColor.lightGray
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

