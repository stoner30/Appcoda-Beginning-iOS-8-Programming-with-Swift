//
//  DetailViewController.swift
//  FoodPin
//
//  Created by Stoner Wang on 15/8/26.
//  Copyright (c) 2015年 AppCoda. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var restaurantImage: String!
    var restaurantName: String!
    var restaurantType: String!
    var restaurantLocation: String!
    
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var restaurantNameLabel: UILabel!
    @IBOutlet var restaurantTypeLabel: UILabel!
    @IBOutlet var restaurantLocationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.restaurantImageView.image = UIImage(named: self.restaurantImage)
        self.restaurantNameLabel.text = self.restaurantName
        self.restaurantLocationLabel.text = self.restaurantLocation
        self.restaurantTypeLabel.text = self.restaurantType
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
