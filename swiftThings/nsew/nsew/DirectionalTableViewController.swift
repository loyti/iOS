//
//  DirectionalTableViewController.swift
//  nsew
//
//  Created by Brice Prather on 9/13/17.
//  Copyright © 2017 Life On Your Terms, Inc. All rights reserved.
//

import UIKit

class DirectionalTableViewController: UIViewController {

    @IBOutlet weak var goBackButton: UIButton!
    
    var direction: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goBackButton.setTitle(direction, for: .normal)
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
