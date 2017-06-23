//
//  ViewController.swift
//  SearchbarTable
//
//  Created by andyron on 9/15/16.
//  Copyright © 2016 andyron. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating {
    var searchContoller: UISearchController!
    
    var listTeams: NSArray!
    var listFilterTeams: NSArray!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let plistPath = NSBundle.mainBundle().pathForResource("team", ofType: "plist")
        self.listTeams = NSArray(contentsOfFile: plistPath!)
        self.filterContentForSearchText("", scope: -1)
        
        self.searchContoller = UISearchController(searchResultsController: nil)
        self.searchContoller.searchResultsUpdater = self
        self.searchContoller.dimsBackgroundDuringPresentation = false
        
        self.searchContoller.searchBar.scopeButtonTitles = ["中文", "英文"]
        self.searchContoller.searchBar.delegate = self
        
        self.tableView.tableHeaderView = self.searchContoller.searchBar
        
        self.searchContoller.searchBar.sizeToFit()
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listFilterTeams.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
        
        let row = indexPath.row
        
        let rowDict = self.listFilterTeams[row] as! NSDictionary
        cell.textLabel?.text = rowDict["name"] as? String
        cell.detailTextLabel?.text = rowDict["image"] as? String
        
        let imagePath = String(format: "%@.png", rowDict["image"] as! String)
        cell.imageView?.image = UIImage(named: imagePath)
        
        cell.accessoryType = .DisclosureIndicator
        
        return cell
        
    }
    
     //MARK: --内容过滤方法
    func filterContentForSearchText(searchText: NSString, scope: Int) {
        if(searchText.length == 0) {
            self.listFilterTeams = NSMutableArray(array: self.listTeams)
            return
        }
        var tempArray: NSArray!
        
        if (scope == 0) { // 中文
            let scopePredicate = NSPredicate(format: "SELF.name contains[c] %@", searchText)
            tempArray = self.listTeams.filteredArrayUsingPredicate(scopePredicate)
            self.listFilterTeams = NSMutableArray(array: tempArray)
        } else if (scope == 1) { // 英文
            let scopePredicate = NSPredicate(format: "SELF.image contains[c] %@", searchText)
            tempArray = self.listTeams.filteredArrayUsingPredicate(scopePredicate)
            self.listFilterTeams = NSMutableArray(array: tempArray)
        } else {    // 查询所有
            self.listFilterTeams = NSMutableArray(array: self.listTeams)
        }
    }
    
    //MARK: -- UISearchBarDelegate
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        self.updateSearchResultsForSearchController(self.searchContoller)
    }
    
    //MARK: --UISearchResultsUpdating
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchString = searchContoller.searchBar.text
        self.filterContentForSearchText(searchString!, scope: searchContoller.searchBar.selectedScopeButtonIndex)
        self.tableView.reloadData()
    }

}

