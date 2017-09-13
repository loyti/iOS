//
//  AddBucketItemTableViewControllerDelegate.swift
//  bucketL
//
//  Created by Brice Prather on 9/12/17.
//  Copyright © 2017 Life On Your Terms, Inc. All rights reserved.
//

import Foundation

protocol AddBucketItemTableViewControllerDelegate: class {
    func itemSaved(by controller: addBucketItemTableViewController, with text: String, at indexPath: NSIndexPath?)
    func cancelButtonPressed(by controller: addBucketItemTableViewController)
}
