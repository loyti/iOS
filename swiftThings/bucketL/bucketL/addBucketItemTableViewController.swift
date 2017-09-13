//
//  addBucketItemTableViewController.swift
//  bucketL
//
//  Created by Brice Prather on 9/12/17.
//  Copyright © 2017 Life On Your Terms, Inc. All rights reserved.
//

import UIKit

class addBucketItemTableViewController: UITableViewController {

    weak var delegate: ViewController?
    
    var item: String?
    
    var indexPath: NSIndexPath?
    
    @IBOutlet weak var itemList: UITextField!
    
    @IBAction func saveButtonPushed(_ sender: UIBarButtonItem) {
        
        let text = itemList.text!
        delegate?.itemSaved(by: self, with: text, at: indexPath)
        
    }

    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        
        delegate?.cancelButtonPressed(by: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemList.text = item

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
