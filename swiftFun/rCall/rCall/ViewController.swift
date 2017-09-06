//
//  ViewController.swift
//  rCall
//
//  Created by Brice Prather on 9/6/17.
//  Copyright © 2017 Life On Your Terms, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomNameLabel.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
        updateUI()
    }
    
    let randomNames = [
        "Brice", "Audrey", "Elizabeth", "Chasin", "David", "Jimmy"
    ]
    var randomNum:Int = Int(arc4random_uniform(5))
    
    @IBOutlet weak var randomNameLabel: UILabel!
    
    @IBAction func coldCallButton(_ sender: UIButton) {
        randomNum = Int(arc4random_uniform(5))
        print("Cold Call Button Pressed and Random Number \(randomNum) generated")
        
        if randomNameLabel.isHidden == true {
            randomNameLabel.isHidden = false
            randomNameLabel.text = randomNames[randomNum]
            updateUI()
        } else {
            randomNameLabel.isHidden = true
            updateUI()
        }
        updateUI()
    }
    
    func updateUI() {
        randomNameLabel.text = randomNames[randomNum]
        randomNameLabel.isHidden = false
        
        // set questionLabel's text to equal quizBank[currentQuestion].0
        // set answerLabel's text to equal quizBank[currentQuestion].1
        // then set answerLabel to be hidden
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

