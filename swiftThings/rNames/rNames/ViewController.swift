//
//  ViewController.swift
//  rNames
//
//  Created by Brice Prather on 9/11/17.
//  Copyright © 2017 Life On Your Terms, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let people = ["George", "Betty", "Fran", "Joe", "Helga", "Wilfred", "Sally"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView (_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        
        cell.textLabel?.text = self.people[indexPath.row]
        
        let age = arc4random_uniform(95-5) + 5
        cell.detailTextLabel?.text = "\(age) years old"
        
        cell.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(255-0))/255, green: CGFloat(arc4random_uniform(255-0))/255, blue: CGFloat(arc4random_uniform(255-0))/255, alpha:  1)
        // random alpha CGFloat(arc4random_uniform(10-1))/4
        return cell
    }
}
