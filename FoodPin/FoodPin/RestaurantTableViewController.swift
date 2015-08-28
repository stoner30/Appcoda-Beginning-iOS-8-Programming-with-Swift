//
//  RestaurantTableTableViewController.swift
//  FoodPin
//
//  Created by Stoner Wang on 15/8/26.
//  Copyright (c) 2015年 AppCoda. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    var restaurants: [Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop",
            location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong",
            image: "cafedeadend.jpg", isVisited: true),
        Restaurant(name: "Homei", type: "Cafe",
            location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong",
            image: "homei.jpg", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House",
            location: "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong",
            image: "teakha.jpg", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink",
            location: "Shop B, 20 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong",
            image: "cafeloisl.jpg", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French",
            location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong",
            image: "petiteoyster.jpg", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery",
            location: "Shop J-K., 200 Hollywood Road, SOHO, Sheung Wan, Hong Kong",
            image: "forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery",
            location: "G/F, 62 Po Hing Fong, Sheung Wan, Hong Kong",
            image: "posatelier.jpg", isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate",
            location: "633 Bourke St Sydney New South Wales 2010 Surry Hills",
            image: "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe",
            location: "412-414 George St Sydney New South Wales",
            image: "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood",
            location: "Shop 1 61 York St Sydney New South Wales",
            image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American",
            location: "95 1st Ave New York, NY 10003",
            image: "upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "American",
            location: "229 S 4th St Brooklyn, NY 11211",
            image: "traif.jpg", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch",
            location: "445 Graham Ave Brooklyn, NY 11211",
            image: "grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea",
            location: "413 Graham Ave Brooklyn, NY 11211",
            image: "wafflewolf.jpg", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea",
            location: "18 Bedford Ave Brooklyn, NY 11222",
            image: "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American",
            location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220",
            image: "cafelore.jpg", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish",
            location: "308 E 6th St New York, NY 10003",
            image: "confessional.jpg", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish",
            location: "54 Frith Street London W1D 4SL United Kingdom",
            image: "barrafina.jpg", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish",
            location: "10 Seymour Place London W1H 7ND United Kingdom",
            image: "donostia.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British",
            location: "2 Regency Street London SW1P 4BZ United Kingdom",
            image: "royaloak.jpg", isVisited: false),
        Restaurant(name: "Thai Cafe", type: "Thai",
            location: "22 Charlwood Street London SW1V 2DY Pimlico",
            image: "thaicafe.jpg", isVisited: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.hidesBarsOnSwipe = true
                
        self.tableView.estimatedRowHeight = 80.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restaurants.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CustomTableViewCell

        // Configure the cell...
        let restaurant = self.restaurants[indexPath.row]
        cell.nameLabel.text = restaurant.name
        cell.thumbnailImageView.image = UIImage(named: restaurant.image)
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        cell.locationLabel.text = restaurant.location
        cell.typeLabel.text = restaurant.type

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
            self.restaurants.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        })
        deleteAction.backgroundColor = UIColor(red: 51.0 / 255.0, green: 51.0 / 255.0, blue: 51.0 / 255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    }
    
    // MASK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let destinationController = segue.destinationViewController as! DetailViewController
                destinationController.restaurant = self.restaurants[indexPath.row]
            }
        }
    }
    
    @IBAction func unwindToHomeScreen(segue: UIStoryboardSegue) {
        
    }

}
