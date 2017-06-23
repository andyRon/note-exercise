//
//  ViewController.swift
//  Simple Table
//
//  Created by andyron on 16/6/25.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private let dwarves = [
        "Sleepy", "Sneezy", "Bashful", "Happy",
        "Doc", "Grumpy", "Dopey",
        "Thorin", "Dorin", "Nori", "Ori",
        "Balin", "Dwalin", "Fili", "Kili",
        "Oin", "Gloin", "Bifur", "Bofur",
        "Bombur"
    ]
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return dwarves.count
    }
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(
//                style: UITableViewCellStyle.Default,
//                style: UITableViewCellStyle.Subtitle,
                style: UITableViewCellStyle.Value1,
                reuseIdentifier: simpleTableIdentifier)
        }
        
        let image = UIImage(named: "star")
        cell?.imageView?.image = image
//        if (indexPath.row == 2) {
            let highlightedImage = UIImage(named: "star2")
            cell?.imageView?.highlightedImage = highlightedImage
//        }
        
        if indexPath.row < 7 {
            cell?.detailTextLabel?.text = "Mr Disney"
        } else {
            cell?.detailTextLabel?.text = "Mr Ron"
        }
        
        
        cell?.textLabel?.text = dwarves[indexPath.row]
        cell?.textLabel?.font = UIFont.boldSystemFontOfSize(50)
        
        return cell!
    }
    
    func tableView(tableView: UITableView,
                   indentationLevelForRowAtIndexPath
                   indexPath: NSIndexPath) -> Int {
        return indexPath.row % 4
    }
    // 控制row是否可以被选中
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
//        return indexPath.row == 0 ? nil : indexPath
        if indexPath.row == 0 {
            return nil
        } else if indexPath.row % 2 == 0 {
            return NSIndexPath(forRow: indexPath.row + 1, inSection: indexPath.section)
        } else {
            return indexPath
        }
    }
    // row选中后的处理
    func tableView(tableView: UITableView,
                   didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let rowValue = dwarves[indexPath.row]
        let message = "You selected \(rowValue)"
        let controller = UIAlertController(title: "Row Selected",
                                           message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Yes I Did",
                                   style: .Default, handler: nil) // 点了没反应
        controller.addAction(action)
        presentViewController(controller, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return indexPath.row == 0 ? 120 : 70
    }

    

}

