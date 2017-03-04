//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by andyron on 2017/3/2.
//  Copyright © 2017年 andyron. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var restaurantImageView: UIImageView!
//    @IBOutlet var restaurantNameLabel: UILabel!
//    @IBOutlet var restaurantLocationLabel: UILabel!
//    @IBOutlet var restaurantTypeLabel: UILabel!
    
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.restaurantImageView.image = UIImage(named: restaurant.image)
//        self.restaurantNameLabel.text = restaurant.name
//        self.restaurantLocationLabel.text = restaurant.location
//        self.restaurantTypeLabel.text = restaurant.type
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RestaurantDetailTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = self.restaurant.name
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = self.restaurant.type
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = self.restaurant.location
        case 3:
            cell.fieldLabel.text = "Been here"
            cell.valueLabel.text = self.restaurant.isVisited ? "Yes, I've been here" : "No"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        return cell
    }
}
