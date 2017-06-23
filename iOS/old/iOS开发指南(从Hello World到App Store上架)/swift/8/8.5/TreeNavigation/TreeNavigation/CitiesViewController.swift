//
//  CitiesViewController.swift
//  TreeNavigation
//
//  Created by andyron on 2016/10/25.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class CitiesViewController: UITableViewController {

    var listData: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //MARK: -- 实现表视图数据源方法
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "CellIdentifier"
        
        let cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        let row = indexPath.row
        let dict = self.listData[row] as! NSDictionary
        cell.textLabel?.text = dict["name"] as? String
        
        return cell
    }
    
    //MARK: -- 场景过渡之前的预处理(当两个视图间进行跳转的时候，连接两个视图的过渡就会触发该方法)
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ShowSelectedCity") {
            let indexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
            let selectedIndex = indexPath.row
            
            let dict = self.listData[selectedIndex] as! NSDictionary
            
            let detailViewController = segue.destinationViewController as! DetailViewController
            detailViewController.url = dict["url"] as! String
            detailViewController.title = dict["name"] as? String
            
        }
    }

}
