//
//  ViewController.swift
//  tipster
//
//  Created by Brice Prather on 9/10/17.
//  Copyright © 2017 Life On Your Terms, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func resetAmountButton(_ sender: UIButton) {
    }

    @IBOutlet weak var resetAmount: UIButton!
    @IBOutlet weak var decimalPoint: UIButton!
    
    @IBOutlet var numButton: [UIButton]!
    
    @IBAction func numberEntered(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

