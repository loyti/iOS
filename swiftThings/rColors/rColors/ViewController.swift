//
//  ViewController.swift
//  rColors
//
//  Created by Brice Prather on 9/11/17.
//  Copyright © 2017 Life On Your Terms, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let colors = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue, UIColor.purple]

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
        
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "color", for: indexPath)
        
        cell.backgroundColor = self.colors[indexPath.row]
        
        return cell
    }
}
