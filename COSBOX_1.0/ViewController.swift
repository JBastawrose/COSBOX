//
//  ViewController.swift
//  COSBOX_1.0
//
//  Created by Justin on 1/25/15.
//  Copyright (c) 2015 Justin Bastawrose. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {    
    @IBOutlet weak var tableViewObj: UITableView!
    var refreshControl:UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MY COSBOX"
        
        tableViewObj.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refersh")
        self.refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableViewObj.addSubview(refreshControl)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        tableViewObj.deselectRowAtIndexPath(indexPathTapped, animated: true)
        
        //tableViewObj.reloadData()
        //tableViewObj.reloadSections(sectionsUpdated, withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    
    func refresh(sender:AnyObject)
    {
        // Updating data here...
        
        self.tableViewObj.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    func insertNewObject (sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("addItem", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return categoryOptions.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if (section == 0) {
            return categoryOptions[0]
        } else if (section == 1) {
            return categoryOptions[1]
        } else if (section == 2) {
            return categoryOptions[2]
        } else if (section == 3) {
            return categoryOptions[3]
        } else if (section == 4) {
            return categoryOptions[4]
        } else {
            return categoryOptions[5]
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (section == 0) {
            foundationItems.removeAll(keepCapacity: false)
            fetchFoundations()
            return (foundationItems.count)
        } else if (section == 1) {
            blushItems.removeAll(keepCapacity: false)
            fetchBlushes()
            return (blushItems.count)
        } else if (section == 2) {
            eyesItems.removeAll(keepCapacity: false)
            fetchEyes()
            return (eyesItems.count)
        } else if (section == 3) {
            lipsItems.removeAll(keepCapacity: false)
            fetchLips()
            return (lipsItems.count)
        } else if (section == 4) {
            nailsItems.removeAll(keepCapacity: false)
            fetchNails()
            return (nailsItems.count)
        } else {
            otherItems.removeAll(keepCapacity: false)
            fetchOthers()
            return (otherItems.count)
        }
    }
    
    // what cell should look like at given indexPath...
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIdentifier)
        
        if (indexPath.section == 0) {
            foundationItems.removeAll(keepCapacity: false)
            fetchFoundations()
            if (foundationItems.count > 0 && indexPath.row < foundationItems.count) {
                cell.imageView?.image = UIImage(data: foundationItems[indexPath.row].picture)
                cell.textLabel?.text = foundationItems[indexPath.row].brand
                cell.detailTextLabel?.text = foundationItems[indexPath.row].itemDescription
            }
        } else if (indexPath.section == 1) {
            blushItems.removeAll(keepCapacity: false)
            fetchBlushes()
            if (blushItems.count > 0 && indexPath.row < blushItems.count) {
                cell.imageView?.image = UIImage(data: blushItems[indexPath.row].picture)
                cell.textLabel?.text = blushItems[indexPath.row].brand
                cell.detailTextLabel?.text = blushItems[indexPath.row].itemDescription
            }
        } else if (indexPath.section == 2) {
            eyesItems.removeAll(keepCapacity: false)
            fetchEyes()
            if (eyesItems.count > 0 && indexPath.row < eyesItems.count) {
                cell.imageView?.image = UIImage(data: eyesItems[indexPath.row].picture)
                cell.textLabel?.text = eyesItems[indexPath.row].brand
                cell.detailTextLabel?.text = eyesItems[indexPath.row].itemDescription
            }
        } else if (indexPath.section == 3) {
            lipsItems.removeAll(keepCapacity: false)
            fetchLips()
            if (lipsItems.count > 0 && indexPath.row < lipsItems.count) {
                cell.imageView?.image = UIImage(data: lipsItems[indexPath.row].picture)
                cell.textLabel?.text = lipsItems[indexPath.row].brand
                cell.detailTextLabel?.text = lipsItems[indexPath.row].itemDescription
            }
        } else if (indexPath.section == 4) {
            nailsItems.removeAll(keepCapacity: false)
            fetchNails()
            if (nailsItems.count > 0 && indexPath.row < nailsItems.count) {
                cell.imageView?.image = UIImage(data: nailsItems[indexPath.row].picture)
                cell.textLabel?.text = nailsItems[indexPath.row].brand
                cell.detailTextLabel?.text = nailsItems[indexPath.row].itemDescription
            }
        } else {
            otherItems.removeAll(keepCapacity: false)
            fetchOthers()
            if (otherItems.count > 0 && indexPath.row < otherItems.count) {
                cell.imageView?.image = UIImage(data: otherItems[indexPath.row].picture)
                cell.textLabel?.text = otherItems[indexPath.row].brand
                cell.detailTextLabel?.text = otherItems[indexPath.row].itemDescription
            }
        }
        return cell
    }
    
    // what to do when cell at indexPath is tapped...
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        categoryTapped = indexPath.section
        indexPathWas = indexPath.row
        indexPathTapped = indexPath
        self.performSegueWithIdentifier("cellSelected", sender: self)
    }
    
//    func scrollTo(indexPathToScrollTo: NSIndexPath) {
//        tableViewObj.scrollToRowAtIndexPath(indexPathToScrollTo, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
//    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if(editingStyle == .Delete ) {
            if (indexPath.section == 0) {
                foundationItems.removeAll(keepCapacity: false)
                fetchFoundations()
                managedObjectContext?.deleteObject(foundationItems[indexPath.row])
            } else if (indexPath.section == 1) {
                blushItems.removeAll(keepCapacity: false)
                fetchBlushes()
                managedObjectContext?.deleteObject(blushItems[indexPath.row])
            } else if (indexPath.section == 2) {
                eyesItems.removeAll(keepCapacity: false)
                fetchEyes()
                managedObjectContext?.deleteObject(eyesItems[indexPath.row])
            } else if (indexPath.section == 3) {
                lipsItems.removeAll(keepCapacity: false)
                fetchLips()
                managedObjectContext?.deleteObject(lipsItems[indexPath.row])
            } else if (indexPath.section == 4) {
                nailsItems.removeAll(keepCapacity: false)
                fetchNails()
                managedObjectContext?.deleteObject(nailsItems[indexPath.row])
            }else {
                otherItems.removeAll(keepCapacity: false)
                fetchOthers()
                managedObjectContext?.deleteObject(otherItems[indexPath.row])
            }
            
            // Tell the table view to animate out that row
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
            // Refresh the table view to indicate that it's deleted
            tableView.reloadData()
        }
    }
}





