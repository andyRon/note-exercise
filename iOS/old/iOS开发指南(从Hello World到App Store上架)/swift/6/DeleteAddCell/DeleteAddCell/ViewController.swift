//
//  ViewController.swift
//  DeleteAddCell
//
//  Created by andyron on 9/17/16.
//  Copyright © 2016 andyron. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet var txtField: UITextField!
    
    var listTeams: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 将编辑按钮设置成导航栏右边
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationItem.title = "单元格插入和删除"
        
        self.txtField.hidden = true
        self.txtField.delegate = self
        
        self.listTeams = NSMutableArray(array: ["上海", "北京", "天津"])
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
        if editing {
            self.txtField.hidden = false
        } else {
            self.txtField.hidden = true
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listTeams.count + 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifer = "CellIdentifer"
        
        let b_addCell = (indexPath.row == self.listTeams.count)
        
        let cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifer, forIndexPath: indexPath)
        
        if !b_addCell { //普通单元格
            cell.accessoryType = .DisclosureIndicator
            cell.textLabel?.text = self.listTeams[indexPath.row] as? String
        } else { // add单元格
            self.txtField.frame = CGRectMake(40, 0, 300, cell.frame.size.height)
            self.txtField.borderStyle = .None
            self.txtField.placeholder = "Add..."
            self.txtField.text = ""
            cell.addSubview(self.txtField)
        }
        return cell
    }
    // 单元格编辑图标设定
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if indexPath.row == listTeams.count {
            return .Insert
        } else {
            return .Delete
        }
    }
    // 删除和插入处理
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let indexPaths = NSArray(array:[indexPath]) as! [NSIndexPath]
        
        if editingStyle == .Delete {
            self.listTeams.removeObjectAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            self.listTeams.insertObject(self.txtField.text!, atIndex: self.listTeams.count)
            self.tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Fade)
        }
        self.tableView.reloadData()
    }
    // 单元格被选择时是否高亮
    override func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.row == self.listTeams.count {
            return false
        } else {
            return true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

