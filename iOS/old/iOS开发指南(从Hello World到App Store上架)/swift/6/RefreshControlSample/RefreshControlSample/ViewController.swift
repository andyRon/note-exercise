//
//  ViewController.swift
//  RefreshControlSample
//
//  Created by andyron on 9/17/16.
//  Copyright © 2016 andyron. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var Logs: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.Logs = NSMutableArray()
        var date = NSDate()
        self.Logs.addObject(date)
        
        var rc = UIRefreshControl()
        rc.attributedTitle = NSAttributedString(string: "下拉刷新")
        rc.addTarget(self, action: "refreshTableView", forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = rc
    }

    func refreshTableView() {
        if self.refreshControl?.refreshing == true {
            self.refreshControl?.attributedTitle = NSAttributedString(string: "加载中...")
            let date = NSDate()
            self.Logs.addObject(date)
            
            self.refreshControl?.endRefreshing()
            self.refreshControl?.attributedTitle = NSAttributedString(string: "下拉刷新")
            
            self.tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.Logs.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CellIdentifier"
        let cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        let dateFormatter : NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss zzz"
        
        let theDate = self.Logs[indexPath.row] as! NSDate
        cell.textLabel?.text = dateFormatter.stringFromDate(theDate)
        
        cell.accessoryType = .DisclosureIndicator
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

