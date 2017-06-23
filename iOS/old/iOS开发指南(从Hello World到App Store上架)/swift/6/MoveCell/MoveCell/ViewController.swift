//
//  ViewController.swift
//  MoveCell
//
//  Created by andyron on 9/17/16.
//  Copyright © 2016 andyron. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var listTeams: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 将编辑按钮设置成导航栏右边
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationItem.title = "单元格移动"
        
        self.listTeams = NSMutableArray(array: ["上海", "北京", "天津"])

    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
    }
    
    // 单元格编辑图标设定
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .None
    }
    
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    // 单元格被移动时触发
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let stringToMove = self.listTeams[sourceIndexPath.row] as! String
        
        self.listTeams.removeObjectAtIndex(sourceIndexPath.row)
        self.listTeams.insertObject(stringToMove, atIndex: destinationIndexPath.row)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listTeams.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifer = "CellIdentifer"
        
        
        let cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifer, forIndexPath: indexPath)
        cell.accessoryType = .DisclosureIndicator
        cell.textLabel?.text = self.listTeams[indexPath.row] as? String
        
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

