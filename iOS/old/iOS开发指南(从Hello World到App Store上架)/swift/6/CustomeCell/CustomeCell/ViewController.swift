//
//  ViewController.swift
//  CustomeCell
//
//  Created by andyron on 16/9/2.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var listTeams: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let plistPath = NSBundle.mainBundle().pathForResource("team", ofType: "plist")
        
        self.listTeams = NSArray(contentsOfFile: plistPath!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listTeams.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "CellIdentifier"
        
        let cell: CustomCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as? CustomCell
        
        let row = indexPath.row
        
        let rowDict = self.listTeams[row] as! NSDictionary
        cell.myLabel.text = rowDict["name"] as? String
        
        let imageFile =  rowDict["image"] as? String
        let imagePath = String(format: "%@.png", imageFile!)
        
        cell.myImageView.image = UIImage(named: imagePath)
        
        cell.accessoryType = .DisclosureIndicator
        
        return cell
        
    }
   
}
