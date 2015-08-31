//
//  Restaurant.swift
//  FoodPin
//
//  Created by Stoner Wang on 15/8/26.
//  Copyright (c) 2015年 AppCoda. All rights reserved.
//

import Foundation
import CoreData

class Restaurant: NSManagedObject {
    @NSManaged var name: String!
    @NSManaged var type: String!
    @NSManaged var location: String!
    @NSManaged var image: NSData!
    @NSManaged var isVisited: NSNumber!
}
