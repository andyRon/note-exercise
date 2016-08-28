//
//  ViewController.swift
//  SimpleTable
//
//  Created by andyron on 16/8/28.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

let CellIdentifier = "CellIdentifier"

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var listTeams: NSArray!
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let plistPath = NSBundle.mainBundle().pathForResource("team", ofType: "plist")
        self.listTeams = NSArray(contentsOfFile: plistPath!)
        
        self.tableView = UITableView(frame: self.view.frame, style: .Plain)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.view.addSubview(self.tableView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listTeams.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 注意与Interface Builder的区别
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(CellIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CellIdentifier)
        }
        
        let row = indexPath.row
        
        let rowDict = self.listTeams[row] as! NSDictionary
        cell.textLabel?.text = rowDict["name"] as? String
        
        let imagePath = String(format: "%@.png", rowDict["image"] as! String)
        cell.imageView?.image = UIImage(named: imagePath)
        
        cell.accessoryType = .DisclosureIndicator
        
        return cell
        
    }


}
