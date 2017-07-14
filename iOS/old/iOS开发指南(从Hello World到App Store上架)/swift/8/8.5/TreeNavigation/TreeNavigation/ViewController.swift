//
//  ViewController.swift
//  TreeNavigation
//
//  Created by andyron on 2016/10/23.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var dicData: NSDictionary!
    var listData: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let plistPath = NSBundle.mainBundle().pathForResource("provinces_cities", ofType: "plist")
        
        self.dicData = NSDictionary(contentsOfFile: plistPath!)
        self.listData = self.dicData.allKeys as NSArray
        self.title = "省份信息"
        
    }

    //MARK: -- 实现表视图数据源方法
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "CellIdentifier"
        
        let cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        let row = indexPath.row
        print(self.listData)
        cell.textLabel?.text = self.listData[row] as? String
        
        return cell
    }
    
    //MARK: -- 场景过渡之前的预处理(当两个视图间进行跳转的时候，连接两个视图的过渡就会触发该方法)
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ShowSelectedProvince") {
            let indexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
            let selectedIndex = indexPath.row
            let citiesViewController = segue.destinationViewController as! CitiesViewController
            let selectName = self.listData[selectedIndex] as! String
            citiesViewController.listData = self.dicData[selectName] as! NSArray
            citiesViewController.title = selectName
            
        }
    }

}
