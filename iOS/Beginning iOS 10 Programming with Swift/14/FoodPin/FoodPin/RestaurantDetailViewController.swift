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
    @IBOutlet var tableView: UITableView!
    
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.restaurantImageView.image = UIImage(named: restaurant.image)

        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        // 设置tableview的没有数据的地方为空
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        // 分割线的颜色
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        // title是UIViewController的属性
        title = restaurant.name
        
        navigationController?.hidesBarsOnSwipe = false

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RestaurantDetailTableViewCell
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
            cell.fieldLabel.text = "Phone"
            cell.valueLabel.text = self.restaurant.phone
        case 4:
            cell.fieldLabel.text = "Been here"
            cell.valueLabel.text = self.restaurant.isVisited ? "Yes, I've been here" : "No"
        
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
