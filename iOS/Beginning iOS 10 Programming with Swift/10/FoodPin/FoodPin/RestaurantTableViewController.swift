//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by andyron on 2017/3/1.
//  Copyright © 2017年 andyron. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "caskpubkitchen.jpg"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]

    var restaurantIsVisited = Array(repeating: false, count: 21)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.restaurantNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RestaurantTableViewCell
        
        cell.nameLabel.text = restaurantNames[indexPath.row]
        
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])

        // 图片圆角
        cell.thumbnailImageView.layer.cornerRadius = 10.0
        cell.thumbnailImageView.clipsToBounds = true
        
        cell.locationLabel.text = restaurantNames[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]

        if (self.restaurantIsVisited[indexPath.row]) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let optionMenu = UIAlertController(title: nil, message: "你想弄啥呢？", preferredStyle: .actionSheet)
    
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        let callAction = UIAlertAction(title: "Call" + "123-000-\(indexPath.row)", style: .default){
            (action: UIAlertAction) in
            let alertMessage = UIAlertController(title: "服务不可用", message: "不好意思，网络错误。请重拨", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
            
        }
        optionMenu.addAction(callAction)
        
        let checkinAction: UIAlertAction
        if self.restaurantIsVisited[indexPath.row] {
            checkinAction = UIAlertAction(title: "Undo Check in", style: .default, handler: {
                (action: UIAlertAction) in
                
                let cell = tableView.cellForRow(at: indexPath)
                cell?.accessoryType = .none
                
                self.restaurantIsVisited[indexPath.row] = false
            })
        } else {
            checkinAction = UIAlertAction(title: "Check in", style: .default, handler: {
                (action: UIAlertAction) in
                
                let cell = tableView.cellForRow(at: indexPath)
                cell?.accessoryType = .checkmark
                
                self.restaurantIsVisited[indexPath.row] = true
            })
        }
        
        optionMenu.addAction(checkinAction)
        
        present(optionMenu, animated: true, completion: nil)
        
        // 去除被选中时，灰色的阴影部分
        tableView.deselectRow(at: indexPath, animated: false)
    }

}
