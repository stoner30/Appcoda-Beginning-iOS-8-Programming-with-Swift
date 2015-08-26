//
//  RestaurantTableTableViewController.swift
//  FoodPin
//
//  Created by Stoner Wang on 15/8/26.
//  Copyright (c) 2015年 AppCoda. All rights reserved.
//

import UIKit

class RestaurantTableTableViewController: UITableViewController {

    var restaurantNames = [
        "Cafe Deadend", "Homei", "Teakha",
        "Cafe Loisl", "Petite Oyster", "For Kee Restaurant",
        "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate",
        "Palomino Espresso", "Upstate", "Traif",
        "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves",
        "Cafe Lore", "Confessional", "Barrafina",
        "Donostia", "Royal Oak", "Thai Cafe"
    ]
    
    var restaurantImages = [
        "cafedeadend.jpg", "homei.jpg", "teakha.jpg",
        "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg",
        "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg",
        "palominoespresso.jpg", "upstate.jpg", "traif.jpg",
        "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg",
        "cafelore.jpg", "confessional.jpg", "barrafina.jpg",
        "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"
    ]
    
    var restaurantLocations = [
        "Hong Kong", "Hong Kong", "Hong Kong",
        "Hong Kong", "Hong Kong", "Hong Kong",
        "Hong Kong", "Sydney", "Sydney",
        "Sydney", "New York", "New York",
        "New York", "New York", "New York",
        "New York", "New York", "London",
        "London", "London", "London"
    ]
    
    var restaurantTypes = [
        "Coffee & Tea Shop", "Cafe", "Tea House",
        "Austrian / Causual Drink", "French", "Bakery",
        "Bakery", "Chocolate", "Cafe",
        "American / Seafood", "American", "American",
        "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea",
        "Latin American", "Spanish", "Spanish",
        "Spanish", "British", "Thai"
    ]
    
    var restaurantIsVisited = [Bool](count: 21, repeatedValue: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restaurantNames.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CustomTableViewCell

        // Configure the cell...
        cell.nameLabel.text = self.restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: self.restaurantImages[indexPath.row])
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        cell.locationLabel.text = self.restaurantLocations[indexPath.row]
        cell.typeLabel.text = self.restaurantTypes[indexPath.row]
//        cell.accessoryType = restaurantIsVisited[indexPath.row] ? .Checkmark : .None

        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        var shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: { (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            let shareMenu = UIAlertController(title: nil, message: "Share using", preferredStyle: .ActionSheet)
            
            let twitterAction = UIAlertAction(title: "Twitter", style: .Default, handler: nil)
            let facebookAction = UIAlertAction(title: "Facebook", style: .Default, handler: nil)
            let emailAction = UIAlertAction(title: "Email", style: .Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            
            shareMenu.addAction(twitterAction)
            shareMenu.addAction(facebookAction)
            shareMenu.addAction(emailAction)
            shareMenu.addAction(cancelAction)
            
            self.presentViewController(shareMenu, animated: true, completion: nil)
        })
        shareAction.backgroundColor = UIColor(red: 255.0 / 255.0, green: 166.0 / 255.0, blue: 51.0 / 255.0, alpha: 1.0)
        
        var deleteAction = UITableViewRowAction(style: .Default, title: "Delete", handler: { (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            self.restaurantNames.removeAtIndex(indexPath.row)
            self.restaurantLocations.removeAtIndex(indexPath.row)
            self.restaurantTypes.removeAtIndex(indexPath.row)
            self.restaurantImages.removeAtIndex(indexPath.row)
            self.restaurantIsVisited.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        })
        deleteAction.backgroundColor = UIColor(red: 51.0 / 255.0, green: 51.0 / 255.0, blue: 51.0 / 255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    }

    // MASK: - Table view delegate
    
    /*
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        let callActionHandler = { (action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)
        }
        let callAction = UIAlertAction(title: "Call 123-000-\(indexPath.row)", style: .Default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        let isVisitedTitle = "I've" + (self.restaurantIsVisited[indexPath.row] ? " not" : "") + " been here"
        let isVisitedAccessoryType = self.restaurantIsVisited[indexPath.row]
            ? UITableViewCellAccessoryType.None
            : UITableViewCellAccessoryType.Checkmark
        let isVisitedAction = UIAlertAction(title: isVisitedTitle, style: .Default, handler: { (action: UIAlertAction!) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = isVisitedAccessoryType
            self.restaurantIsVisited[indexPath.row] = !self.restaurantIsVisited[indexPath.row]
        })
        optionMenu.addAction(isVisitedAction)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    */
    
    // MASK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let destinationController = segue.destinationViewController as! DetailViewController
                
                destinationController.restaurantImage = self.restaurantImages[indexPath.row]
                destinationController.restaurantName = self.restaurantNames[indexPath.row]
                destinationController.restaurantLocation = self.restaurantLocations[indexPath.row]
                destinationController.restaurantType = self.restaurantTypes[indexPath.row]
            }
        }
    }

}
