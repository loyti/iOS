//
//  ViewController.swift
//  nsew
//
//  Created by Brice Prather on 9/13/17.
//  Copyright © 2017 Life On Your Terms, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let direction = sender as! String
        let controller = segue.destination as! DirectionalTableViewController
        
        controller.direction = direction
        
    }
    
    @IBAction func directionButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "DirectionSegue", sender: sender.titleLabel!.text!)
        
    }
    
    @IBAction func toMainView(_ segue: UIStoryboardSegue) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

