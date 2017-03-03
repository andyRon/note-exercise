//
//  Restaurant.swift
//  FoodPin
//
//  Created by andyron on 2017/3/3.
//  Copyright © 2017年 andyron. All rights reserved.
//

import Foundation

class Restaurant {
    var name = ""
    var location = ""
    var type = ""
    var image = ""
    var isVisited = false
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool) {
        self.name = name
        self.location = location
        self.type = type
        self.image = image
        self.isVisited = isVisited
    }
}
