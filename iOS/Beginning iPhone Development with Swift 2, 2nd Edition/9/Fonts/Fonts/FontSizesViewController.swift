//
//  FontSizesViewController.swift
//  Fonts
//
//  Created by andyron on 16/8/4.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class FontSizesViewController: UITableViewController {
    var font:UIFont!
    private static let pointSizes: [CGFloat] = [9,10,11,12,13,14,18,24,36,48,64,72,96,144]
    private static let cellIdentifier = "FontNameAndSize"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = FontSizesViewController.pointSizes[0]
    }

    func fontForDisplay(atIndexPath indexPath:NSIndexPath) -> UIFont {
        let pointSize = FontSizesViewController.pointSizes[indexPath.row]
        return font.fontWithSize(pointSize)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FontSizesViewController.pointSizes.count
    }
    
    override func tableView(tableView: UITableView,
                            cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            FontSizesViewController.cellIdentifier,
            forIndexPath: indexPath)
        cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath)
        cell.textLabel?.text = font.fontName
        cell.detailTextLabel?.text =
            "\(FontSizesViewController.pointSizes[indexPath.row]) point"
        return cell
    }

  
}
