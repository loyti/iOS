//
//  ViewController.swift
//  bList
//
//  Created by Brice Prather on 9/7/17.
//  Copyright © 2017 Life On Your Terms, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let people = ["George", "Betty", "Fran", "Joe", "Helga", "Wilfred", "Sally"]
    
    @IBOutlet weak var beastName: UITextField!
    @IBOutlet var beastCollection: [UITableView]!
    
    @IBAction func addBeast(_ sender: UIButton) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleCell", for: indexPath)
        
        cell.textLabel?.text = self.people[indexPath.row]
        return cell
        
    }
    
}
