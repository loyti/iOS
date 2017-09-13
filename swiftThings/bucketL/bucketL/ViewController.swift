//
//  ViewController.swift
//  bucketL
//
//  Created by Brice Prather on 9/12/17.
//  Copyright © 2017 Life On Your Terms, Inc. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController, AddBucketItemTableViewControllerDelegate {


    var items = [BucketListItem]()
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        fetchAllItems()
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row].text!
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row ")
//        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
        
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        managedObjectContext.delete(item)
        do {
            try managedObjectContext.save()
        } catch {
            print ("\(error)")
        }
        items.remove(at: indexPath.row)
        tableView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddItemSegue" {
            
            let navigationController = segue.destination as! UINavigationController
            let addBucketItemTableViewController = navigationController.topViewController as! addBucketItemTableViewController
            addBucketItemTableViewController.delegate = self
            
        } else if segue.identifier == "EditItemSegue" {
            
            let navigationController = segue.destination as! UINavigationController
            let addBucketItemTableViewController = navigationController.topViewController as! addBucketItemTableViewController
            addBucketItemTableViewController.delegate = self
            
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            addBucketItemTableViewController.item = item.text!
            addBucketItemTableViewController.indexPath = indexPath
            
        }
    }
    
    func fetchAllItems(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "BucketListItem")
        do {
            let result = try managedObjectContext.fetch(request)
            items = result as! [BucketListItem]
        } catch {
            print("\(error)")
        }
    }
    
    func cancelButtonPressed(by controller: addBucketItemTableViewController) {
        print("i'm the hidden controller to cancel")
        dismiss(animated: true, completion: nil)
    }
    
    func itemSaved(by controller: addBucketItemTableViewController, with text: String, at indexPath: NSIndexPath?){
        print("I'm the hidden controller to save")
        
        if let ip = indexPath {
            
            let item = items[ip.row]
            item.text = text
            
        } else {
            
            let item = NSEntityDescription.insertNewObject(forEntityName: "BucketListItem", into: managedObjectContext) as! BucketListItem
            item.text = text
            items.append(item)
            
        }
        
        do {
            try managedObjectContext.save()
        } catch {
            print("\(error)")
        }
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}

