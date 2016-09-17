//
//  ViewController.swift
//  IndexTable
//
//  Created by andyron on 9/15/16.
//  Copyright © 2016 andyron. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var dictData: NSDictionary!
    var listGroupname: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let plistPath = NSBundle.mainBundle().pathForResource("team_dictionary", ofType: "plist")
        
        self.dictData = NSDictionary(contentsOfFile: plistPath!)
        
        let tempList = self.dictData.allKeys as NSArray
        
        self.listGroupname = tempList.sortedArrayUsingSelector("compare:")
    }
    // 数据源方法
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 
        let groupName = self.listGroupname[section] as! String
        let listTeams = self.dictData[groupName] as! NSArray
        return listTeams.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "CellIdentifier"
        
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
            
        }
        
        let section = indexPath.section
        let row = indexPath.row
        let groupName = self.listGroupname[section] as! String
        let listTeams = self.dictData[groupName] as! NSArray
        cell.textLabel?.text = listTeams[row] as? String
        
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.listGroupname.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let groupName = self.listGroupname[section] as! String
        return groupName
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        var listTitles = [String]()
        for item in self.listGroupname {
            let title = item.substringToIndex(1) as String
            listTitles.append(title)
        }
        return listTitles
    }
    
    
}

