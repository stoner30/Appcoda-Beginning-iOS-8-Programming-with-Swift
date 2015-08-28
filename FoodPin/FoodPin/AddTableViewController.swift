//
//  AddTableViewController.swift
//  FoodPin
//
//  Created by Stoner Wang on 15/8/28.
//  Copyright (c) 2015年 AppCoda. All rights reserved.
//

import UIKit

class AddTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    var restaurant: Restaurant?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        yesButton.backgroundColor = UIColor.redColor()
        noButton.backgroundColor = UIColor.lightGrayColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view delegate

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
                let imagePicker = UIImagePickerController()
                
                imagePicker.delegate = self
                
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .PhotoLibrary
                
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MASK: - Image picker controller delegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MASK: - Navigation delegate

    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: false)
    }
    
    @IBAction func pressYesButton(sender: UIButton) {
        if yesButton.backgroundColor == UIColor.redColor() {
            yesButton.backgroundColor = UIColor.lightGrayColor()
            noButton.backgroundColor = UIColor.redColor()
        } else {
            yesButton.backgroundColor = UIColor.redColor()
            noButton.backgroundColor = UIColor.lightGrayColor()
        }
    }
    
    @IBAction func pressNoButton(sender: UIButton) {
        if noButton.backgroundColor == UIColor.redColor() {
            noButton.backgroundColor = UIColor.lightGrayColor()
            yesButton.backgroundColor = UIColor.redColor()
        } else {
            noButton.backgroundColor = UIColor.redColor()
            yesButton.backgroundColor = UIColor.lightGrayColor()
        }
    }
    
    @IBAction func pressSaveButton(sender: AnyObject) {
        performSegueWithIdentifier("unwindToHomeScreen", sender: sender)
        
        let name = nameTextField.text
        let location = locationTextField.text
        let type = typeTextField.text
        let isVisited = yesButton.backgroundColor == UIColor.redColor()
        let image = imageView.image!.description
        
        if name.isEmpty || location.isEmpty || type.isEmpty {
            let alert = UIAlertController(title: "Oops", message: "We can't proceed as you forgot to fill in restaurant name. All fields are mandatory.", preferredStyle: .Alert)
            
            let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            alert.addAction(action)
            
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        restaurant = Restaurant(name: name, type: type, location: location, image: image, isVisited: isVisited)
        
        println("Name: \(restaurant!.name)")
        println("Location: \(restaurant!.location)")
        println("Type: \(restaurant!.type)")
        println("Image: \(restaurant!.image)")
        println("IsVisited: \(restaurant!.isVisited)")
    }
    
}
