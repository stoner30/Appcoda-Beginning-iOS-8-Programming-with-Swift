//
//  Restaurant.swift
//  FoodPin
//
//  Created by Stoner Wang on 15/8/26.
//  Copyright (c) 2015年 AppCoda. All rights reserved.
//

import Foundation

class Restaurant {
    var name: String = ""
    var type: String = ""
    var location: String = ""
    var image: String = ""
    var isVisited: Bool = false
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
}
